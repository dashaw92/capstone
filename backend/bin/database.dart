import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:postgres/postgres.dart' as pg;

part 'database.g.dart';

class IngredientsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 128).unique()();
  RealColumn get amount => real()();
}

class ExtractorsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get label => text().withLength(min: 1, max: 128).unique()();
  TextColumn get script => text()();
}

@DriftDatabase(tables: [IngredientsTable, ExtractorsTable])
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
