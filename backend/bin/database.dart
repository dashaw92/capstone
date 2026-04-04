import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:postgres/postgres.dart' as pg;

part 'database.g.dart';

// Originally, this file contained many tables. As the project evolved, features originally deemed necessary were pruned off.
// Now, at the end, we're left with the single Ingredients Table. It stores exactly two columns: an auto generated ID and the name.
class IngredientsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 128).unique()();
}

@DriftDatabase(tables: [IngredientsTable])
class BackendDatabase extends _$BackendDatabase {
  BackendDatabase([QueryExecutor? executor])
    : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  // As-is, this is obviously hardcoded to expect a database running on localhost:5432.
  // Naturally, it could very easily be exported to a commandline argument accepted from `dart run`.
  // I had no need for this and it made iterating on the project much easier.
  static QueryExecutor _openConnection() {
    return PgDatabase(
      endpoint: pg.Endpoint(
        host: 'localhost',
        database: 'db',
        username: 'postgres',
        password: 'password',
      ),
      // Note: Without this setting, the server was completely incapable of
      // connecting to the local Docker container. Obviously having SSL would be
      // preferable, but for a localhost environment, meh.
      settings: pg.ConnectionSettings(sslMode: pg.SslMode.disable),
    );
  }
}
