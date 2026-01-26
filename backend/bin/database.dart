import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:postgres/postgres.dart' as pg;

part 'database.g.dart';

//WARNING: Do not rename these constants
enum Unit { teaspoon, gram }

class PantryTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 128)();
  RealColumn get amount => real()();
  TextColumn get unit => textEnum<Unit>()();
}

@DriftDatabase(tables: [PantryTable])
class BackendDatabase extends _$BackendDatabase {
  BackendDatabase([QueryExecutor? executor])
    : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return PgDatabase(
      endpoint: pg.Endpoint(
        host: 'localhost',
        database: 'database',
        username: 'postgres',
        password: 'password',
      ),
      settings: pg.ConnectionSettings(sslMode: pg.SslMode.disable),
    );
  }
}
