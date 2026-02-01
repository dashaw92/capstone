import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:drift/drift.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'database.dart';

final _db = BackendDatabase();

// Configure routes.
final _router = Router()
  ..get('/api/v1/upcs', _getUPCs)
  ..post("/api/v1/upcs", _inputUPCs)
  ..delete('/api/v1/upcs/<upc>', _deleteUPC)
  ..get('/api/v1/items', _getItems)
  ..post('/api/v1/items', _inputItems)
  ..delete('/api/v1/items/<itemId>', _deleteItem);

Future<Response> _getUPCs(Request request) async {
  final upcs = await (_db.select(_db.upcTable)).get();
  final items = await (_db.select(_db.namesTable)).get();
  return Response.ok(
    json.encode({'items': items, 'upcs': upcs}),
    headers: {'Content-type': 'application/json'},
  );
}

Future<Response> _inputUPCs(Request request) async {
  final data = jsonDecode(await request.readAsString()) as Map<String, dynamic>;

  for (var i = 0; i < data["upcs"].length && i < data["names"].length; i++) {
    final upc = data["upcs"][i].toLowerCase();
    final name = data["names"][i].toLowerCase();

    //Attempt to insert, if this fails it means the row exists.
    try {
      await _db
          .into(_db.namesTable)
          .insert(NamesTableCompanion.insert(name: name));
    } catch (_) {}

    final row = await (_db.select(
      _db.namesTable,
    )..where((tbl) => tbl.name.lower().equals(name))).getSingle();

    await _db
        .into(_db.upcTable)
        .insert(UpcTableCompanion.insert(itemId: row.itemId, upc: upc));
  }

  return Response.ok(null);
}

Future<Response> _deleteUPC(Request request) async {
  final upc = request.params["upc"];
  if (upc == null) return Response.ok(null);
  await (_db.delete(_db.upcTable)..where((tbl) => tbl.upc.equals(upc))).go();
  return Response.ok(null);
}

Future<Response> _getItems(Request request) async {
  final items = await (_db.select(_db.pantryTable)).get();
  return Response.ok(
    jsonEncode(items),
    headers: {'Content-type': 'application/json'},
  );
}

Future<Response> _inputItems(Request request) async {
  final data = jsonDecode(await request.readAsString()) as List<dynamic>;
  for (var entry in data) {
    final itemId = entry["itemId"];
    final amount = entry["amount"] as double;

    final previous = await (_db.select(
      _db.pantryTable,
    )..where((tbl) => tbl.itemId.equals(itemId))).getSingleOrNull();

    if (previous != null) {
      await (_db.update(
        _db.pantryTable,
      )..where((tbl) => tbl.itemId.equals(itemId))).write(
        PantryTableData(
          itemId: itemId,
          amount: max(0.0, previous.amount + amount),
        ),
      );
    } else {
      _db
          .into(_db.pantryTable)
          .insert(PantryTableCompanion.insert(itemId: itemId, amount: amount));
    }
  }
  return Response.ok(null);
}

Future<Response> _deleteItem(Request request) async {
  final itemId = int.tryParse(request.params["itemId"] ?? "");
  if (itemId == null) return Response.ok(null);
  await (_db.delete(
    _db.pantryTable,
  )..where((tbl) => tbl.itemId.equals(itemId))).go();
  return Response.ok(null);
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
