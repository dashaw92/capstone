import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:postgres/postgres.dart' as pg;

part 'database.g.dart';

/// NamesTable represents the identities of ingredients. [id] is the unique identifier for an ingredient and
/// serves as a FK in the other tables. Name is a unique  human-readable label given to an ingredient, for instance "Powdered Ginger".
class NamesTable extends Table {
  IntColumn get itemId => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 128).unique()();
}

class UpcTable extends Table {
  IntColumn get itemId => integer().references(NamesTable, #itemId)();
  TextColumn get upc => text().withLength(min: 1, max: 12).unique()();
}

class PantryTable extends Table {
  IntColumn get itemId => integer().references(NamesTable, #itemId)();
  //grams
  RealColumn get amount => real()();
}

@DriftDatabase(tables: [NamesTable, UpcTable, PantryTable])
class BackendDatabase extends _$BackendDatabase {
  BackendDatabase([QueryExecutor? executor])
    : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return PgDatabase(
      endpoint: pg.Endpoint(
        host: 'localhost',
        database: 'db',
        username: 'postgres',
        password: 'password',
      ),
      settings: pg.ConnectionSettings(sslMode: pg.SslMode.disable),
    );
  }
}
