import 'dart:ffi';
import 'dart:io' show Directory, File, exit;

import 'package:ffi/ffi.dart';
import 'package:http/http.dart' as http;

// Mirrors the FFIArray struct used to share an FFI-compatible array of strings.
// typedef struct {
//   char **items;
//   size_t len;
// } FFIArray;
final class FFIArray extends Struct {
  external Pointer<Pointer<Utf8>> items;

  @Size()
  external int len;
}

// dart:ffi mirrors of the C FFI API expected of extractors.
// each extractor needs the following three functions defined:

//extern const char *domain(void)
typedef DomainFunc = Pointer<Utf8> Function();
//extern FFIArray *extract(const char *htmlBody)
typedef ExtractFuncNative = FFIArray Function(Pointer<Utf8> str);
//extern void deinit(FFIArray *array)
typedef DeinitFuncNative = Void Function(FFIArray array);
typedef DeinitFunc = void Function(FFIArray array);

// Attempt to find an extractor matching the supplied URL and provide the HTML body to it.
// Once extracted, the FFIArray is copied into Dart's managed memory before being freed via deinit.
// Finally, the client is provided the managed copies of the ingredients via gRPC message.
Future<List<String>?> runExtraction(
  List<Extractor> extractors,
  String recipe,
) async {
  final url = Uri.parse(recipe);
  final extractor = extractors
      .where((ent) => url.host.toLowerCase().contains(ent.domain.toLowerCase()))
      .firstOrNull;

  if (extractor == null) {
    print("No matching extractor for host '${url.host}'!");
    return null;
  }

  final body = await http.read(url);
  return extractor.extract(body);
}

//Wraps over a native library loaded from ../extractors
class Extractor {
  //Handle to the loaded library. Used to lookup exported functions and glue them to the dart:ffi mirrors above.
  final DynamicLibrary _lib;

  //URL supported by this extractor
  late final String domain;

  //Glued to the extract function exported by the native library
  ExtractFuncNative? _extract;
  //Likewise but deinit
  DeinitFunc? _deinit;

  //Open the library upon construction and initialize the domain value
  Extractor(String path) : _lib = DynamicLibrary.open(path) {
    domain = (_lib.lookupFunction<DomainFunc, DomainFunc>(
      "domain",
    ))().toDartString();
  }

  List<String> extract(String body) {
    // No error checking is done here because the client will just interpret a non-response as forever loading (which is perfectly acceptable).
    // It's the responsibility of the extractor developers to comply with the expected API.
    _extract ??= _lib.lookupFunction<ExtractFuncNative, ExtractFuncNative>(
      "extract",
    );

    _deinit ??= _lib.lookupFunction<DeinitFuncNative, DeinitFunc>("deinit");

    // Convert the managed version of the raw HTML body string into a C string.
    final bodyPtr = body.toNativeUtf8();
    // Provide the HTML to the extractor and get the FFIArray back.
    final array = _extract!(bodyPtr);

    // Copy the borrowed strings into managed memory
    final List<String> outputs = [];
    for (var idx = 0; idx < array.len; idx++) {
      final strPtr = array.items[idx];
      outputs.add(strPtr.toDartString());
    }

    // Tell the library we're done with the FFIArray so it can free it safely.
    _deinit!(array);

    return outputs;
  }
}

// Find and load all valid extractors. Platform-specific suffixes (.so, .dll, .dylib) are not considered; all valid suffixes are used regardless of platform.
// Attempts to generate the directory if it does not exist aborting the program upon failure.
Future<List<Extractor>> initExtractors() async {
  final dir = Directory("extractors");
  if (!(await _setupDir(dir))) {
    print("Failed to create extractors directory");
    exit(-1);
  }

  final List<Extractor> extractors = [];
  await for (final file in dir.list()) {
    if (file is! File) continue;

    for (final suffix in ['.so', '.dll', '.dylib']) {
      if (file.path.endsWith(suffix)) {
        var extractor = Extractor(file.absolute.path);
        print(
          "Loaded extractor for domain '${extractor.domain}' from ${file.path}",
        );
        extractors.add(extractor);
        break;
      }
    }
  }

  return extractors;
}

Future<bool> _setupDir(Directory dir) async {
  try {
    await dir.create();
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}
