import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'database.dart';

final _db = BackendDatabase();

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler)
  ..get('/insert/<item>/<amount>/<unit>', _testItemHandler);

Future<Response> _testItemHandler(Request request) async {
  final item = request.params['item'];
  final amount = double.tryParse(request.params['amount'] ?? 'hack');
  final unit = switch (request.params['unit']?.toLowerCase()) {
    'tsp' || 'teaspoon' => Unit.teaspoon,
    'g' || 'gram' => Unit.gram,
    _ => null,
  };

  if (item == null || amount == null || amount <= 0.0 || unit == null) {
    return Response.badRequest();
  }

  await _db
      .into(_db.pantryTable)
      .insert(
        PantryTableCompanion.insert(name: item, amount: amount, unit: unit),
      );

  List<PantryTableData> items = await _db.select(_db.pantryTable).get();

  return Response.ok(
    jsonEncode(items),
    headers: {'Content-type': 'application/json'},
  );
}

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addHandler(_router.call);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
