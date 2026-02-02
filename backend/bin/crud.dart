import 'package:drift/drift.dart';
import 'package:pantry_protocol/protocol.dart';
import 'package:protobuf/well_known_types/google/protobuf/empty.pb.dart';

import 'database.dart';

//TODO fortify these functions to protect against non-existent rows. At present, these functions
// fail hard if anything is wrong.

final class Crud {
  final _db = BackendDatabase();

  Future<Name> getNameById(int id) async {
    NamesTableData? r = await (_db.select(
      _db.namesTable,
    )..where((tbl) => tbl.itemId.equals(id))).getSingleOrNull();

    return Name(id: r?.itemId, label: r?.name);
  }

  Future<Name> getName(String label) async {
    NamesTableData? r =
        await (_db.select(_db.namesTable)
              ..where((tbl) => tbl.name.lower().equals(label.toLowerCase())))
            .getSingleOrNull();

    return Name(id: r?.itemId, label: r?.name);
  }

  Future<Name> createName(CreateNameRequest request) async {
    NamesTableData? r = await _db
        .into(_db.namesTable)
        .insertReturningOrNull(NamesTableCompanion.insert(name: request.label));

    if (r == null) {
      final old =
          await (_db.select(_db.namesTable)..where(
                (tbl) => tbl.name.lower().equals(request.label.toLowerCase()),
              ))
              .getSingleOrNull();

      r = old;
    }

    return Name(id: r?.itemId, label: r?.name);
  }

  Future<CreateUpcResponse> createUpc(Upc request) async {
    UpcTableData? r = await _db
        .into(_db.upcTable)
        .insertReturningOrNull(
          UpcTableCompanion.insert(itemId: request.nameId, upc: request.upc),
        );

    return CreateUpcResponse(
      upc: Upc(upc: r?.upc, nameId: r?.itemId),
    );
  }

  Future<Empty> deleteName(DeleteNameRequest request) async {
    await (_db.delete(
      _db.namesTable,
    )..where((tbl) => tbl.itemId.equals(request.nameId))).go();
    return Empty();
  }

  Future<Empty> deleteUpc(DeleteUpcRequest request) async {
    await (_db.delete(
      _db.upcTable,
    )..where((tbl) => tbl.upc.lower().equals(request.upc.toLowerCase()))).go();
    return Empty();
  }

  Future<Item> getAmount(GetAmountRequest request) async {
    PantryTableData? r = await (_db.select(
      _db.pantryTable,
    )..where((tbl) => tbl.itemId.equals(request.nameId))).getSingleOrNull();

    return Item(nameId: r?.itemId, amount: r?.amount);
  }

  Future<ListUpcsResponse> listAllUpcs() async {
    final upcRows = await (_db.select(_db.upcTable)).get();
    final upcs = upcRows.map((row) => Upc(upc: row.upc, nameId: row.itemId));
    return ListUpcsResponse(upcs: upcs);
  }

  Future<ListNamesResponse> listNames() async {
    final nameRows = await (_db.select(_db.namesTable)).get();
    final names = nameRows.map((row) => Name(id: row.itemId, label: row.name));
    return ListNamesResponse(names: names);
  }

  Future<ListUpcsResponse> listUpcs(GetUpcsRequest request) async {
    final upcRows = await (_db.select(
      _db.upcTable,
    )..where((tbl) => tbl.itemId.equals(request.nameId))).get();
    final upcs = upcRows.map((row) => Upc(upc: row.upc, nameId: row.itemId));
    return ListUpcsResponse(upcs: upcs);
  }

  Future<PantryTableData> _getPantryItem(int nameId) async => await (_db.select(
    _db.pantryTable,
  )..where((tbl) => tbl.itemId.equals(nameId))).getSingle();

  Future<Item> setAmount(int nameId, double amount) async {
    await (_db.update(_db.pantryTable)
          ..where((tbl) => tbl.itemId.equals(nameId)))
        .write(PantryTableCompanion.insert(itemId: nameId, amount: amount));

    final r = await _getPantryItem(nameId);
    return Item(nameId: r.itemId, amount: r.amount);
  }

  Future<Item> updateAmount(AddAmountRequest request) async {
    final r = await _getPantryItem(request.nameId);
    return setAmount(r.itemId, r.amount + request.amount);
  }
}
