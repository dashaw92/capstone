import 'package:drift/drift.dart';
import 'package:pantry_protocol/protocol.dart';
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart';

import 'database.dart';

final class Crud {
  final _db = BackendDatabase();

  Future<Ingredient> getIngredientById(int id) async {
    IngredientsTableData? r = await (_db.select(
      _db.ingredientsTable,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

    return Ingredient(id: r?.id, label: r?.name);
  }

  Future<Ingredient> getIngredient(String label) async {
    IngredientsTableData? r =
        await (_db.select(_db.ingredientsTable)
              ..where((tbl) => tbl.name.lower().equals(label.toLowerCase())))
            .getSingleOrNull();

    return Ingredient(id: r?.id, label: r?.name);
  }

  Future<CreatedIngredientsResponse> createIngredients(
    CreateIngredientsRequest request,
  ) async {
    _db.batch((b) {
      b.insertAll(_db.ingredientsTable, [
        for (var name in request.label)
          IngredientsTableCompanion.insert(name: name),
      ]);
    });

    List<IngredientsTableData> created = await (_db.select(
      _db.ingredientsTable,
    )..where((tbl) => tbl.name.isIn(request.label))).get();

    List<Ingredient> domainMapped = created
        .map((e) => Ingredient(id: e.id, label: e.name))
        .toList();
    return CreatedIngredientsResponse(ingredients: domainMapped);
  }

  Future<Empty> deleteIngredient(DeleteIngredientRequest request) async {
    await (_db.delete(
      _db.ingredientsTable,
    )..where((tbl) => tbl.id.equals(request.id))).go();
    return Empty();
  }

  Future<ListIngredientsResponse> listIngredients() async {
    final rows = await _db.select(_db.ingredientsTable).get();
    final items = rows.map((r) => Ingredient(id: r.id, label: r.name));
    return ListIngredientsResponse(ingredients: items);
  }

  Future<Pong> ping() async {
    return Pong(response: "ok");
  }
}
