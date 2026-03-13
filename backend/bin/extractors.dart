import 'dart:ffi';
import 'dart:io' show Directory, File, exit;

import 'package:ffi/ffi.dart';

final class FFIArray extends Struct {
  external Pointer<Pointer<Utf8>> items;

  @Size()
  external int len;
}

typedef ExtractFuncNative = FFIArray Function(Pointer<Utf8> str);
typedef DeinitFuncNative = Void Function(FFIArray array);
typedef DeinitFunc = void Function(FFIArray array);

class Extractor {
  final DynamicLibrary _lib;

  ExtractFuncNative? _extract;
  DeinitFunc? _deinit;

  Extractor(String path) : _lib = DynamicLibrary.open(path);

  List<String> extract(String body) {
    _extract ??= _lib.lookupFunction<ExtractFuncNative, ExtractFuncNative>(
      "extract",
    );

    _deinit ??= _lib.lookupFunction<DeinitFuncNative, DeinitFunc>("deinit");

    final bodyPtr = body.toNativeUtf8();
    final array = _extract!(bodyPtr);

    final List<String> outputs = [];
    for (var idx = 0; idx < array.len; idx++) {
      final strPtr = array.items[idx];
      outputs.add(strPtr.toDartString());
    }

    _deinit!(array);
    return outputs;
  }
}

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
        extractors.add(Extractor(file.absolute.path));
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
