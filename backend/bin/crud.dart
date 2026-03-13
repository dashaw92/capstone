import 'package:drift/drift.dart';
import 'package:pantry_protocol/protocol.dart';
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart';

import 'database.dart';

//TODO fortify these functions to protect against non-existent rows. At present, these functions
// fail hard if anything is wrong.

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

  Future<Ingredient> createIngredient(CreateIngredientRequest request) async {
    IngredientsTableData? r = await _db
        .into(_db.ingredientsTable)
        .insertReturningOrNull(
          IngredientsTableCompanion.insert(
            name: request.label,
            amount: request.amount,
          ),
        );

    if (r == null) {
      final old =
          await (_db.select(_db.ingredientsTable)..where(
                (tbl) => tbl.name.lower().equals(request.label.toLowerCase()),
              ))
              .getSingleOrNull();

      r = old;
    }

    return Ingredient(id: r?.id, label: r?.name);
  }

  Future<Empty> deleteIngredient(DeleteIngredientRequest request) async {
    await (_db.delete(
      _db.ingredientsTable,
    )..where((tbl) => tbl.id.equals(request.id))).go();
    return Empty();
  }

  Future<ListIngredientsResponse> listIngredients() async {
    final rows = await _db.select(_db.ingredientsTable).get();
    final items = rows.map(
      (r) => Ingredient(id: r.id, label: r.name, amount: r.amount),
    );
    return ListIngredientsResponse(ingredients: items);
  }

  Future<IngredientsTableData> _getPantryIngredient(int nameId) async =>
      await (_db.select(
        _db.ingredientsTable,
      )..where((tbl) => tbl.id.equals(nameId))).getSingle();

  Future<Ingredient> setAmount(int nameId, double amount) async {
    await (_db.update(_db.ingredientsTable)
          ..where((tbl) => tbl.id.equals(nameId)))
        .write(IngredientsTableCompanion(amount: Value(amount)));
    final r = await _getPantryIngredient(nameId);

    return Ingredient(id: r.id, label: r.name, amount: r.amount);
  }

  Future<Ingredient> updateAmount(UpdateIngredientRequest request) async {
    final r = await _getPantryIngredient(request.id);
    return setAmount(r.id, request.amount);
  }

  Future<Pong> ping() async {
    return Pong(response: "ok");
  }

  Future<Ingredient> renameIngredient(RenameIngredientRequest request) async {
    await (_db.update(_db.ingredientsTable)
          ..where((tbl) => tbl.id.equals(request.id)))
        .write(IngredientsTableCompanion(name: Value(request.newLabel)));

    final r = await _getPantryIngredient(request.id);
    return Ingredient(id: r.id, label: r.name, amount: r.amount);
  }
}
