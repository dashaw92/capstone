// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $IngredientsTableTable extends IngredientsTable
    with TableInfo<$IngredientsTableTable, IngredientsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IngredientsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 128,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ingredients_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<IngredientsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IngredientsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IngredientsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $IngredientsTableTable createAlias(String alias) {
    return $IngredientsTableTable(attachedDatabase, alias);
  }
}

class IngredientsTableData extends DataClass
    implements Insertable<IngredientsTableData> {
  final int id;
  final String name;
  const IngredientsTableData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  IngredientsTableCompanion toCompanion(bool nullToAbsent) {
    return IngredientsTableCompanion(id: Value(id), name: Value(name));
  }

  factory IngredientsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IngredientsTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  IngredientsTableData copyWith({int? id, String? name}) =>
      IngredientsTableData(id: id ?? this.id, name: name ?? this.name);
  IngredientsTableData copyWithCompanion(IngredientsTableCompanion data) {
    return IngredientsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IngredientsTableData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IngredientsTableData &&
          other.id == this.id &&
          other.name == this.name);
}

class IngredientsTableCompanion extends UpdateCompanion<IngredientsTableData> {
  final Value<int> id;
  final Value<String> name;
  const IngredientsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  IngredientsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<IngredientsTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  IngredientsTableCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return IngredientsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IngredientsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

abstract class _$BackendDatabase extends GeneratedDatabase {
  _$BackendDatabase(QueryExecutor e) : super(e);
  $BackendDatabaseManager get managers => $BackendDatabaseManager(this);
  late final $IngredientsTableTable ingredientsTable = $IngredientsTableTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [ingredientsTable];
}

typedef $$IngredientsTableTableCreateCompanionBuilder =
    IngredientsTableCompanion Function({Value<int> id, required String name});
typedef $$IngredientsTableTableUpdateCompanionBuilder =
    IngredientsTableCompanion Function({Value<int> id, Value<String> name});

class $$IngredientsTableTableFilterComposer
    extends Composer<_$BackendDatabase, $IngredientsTableTable> {
  $$IngredientsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$IngredientsTableTableOrderingComposer
    extends Composer<_$BackendDatabase, $IngredientsTableTable> {
  $$IngredientsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$IngredientsTableTableAnnotationComposer
    extends Composer<_$BackendDatabase, $IngredientsTableTable> {
  $$IngredientsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$IngredientsTableTableTableManager
    extends
        RootTableManager<
          _$BackendDatabase,
          $IngredientsTableTable,
          IngredientsTableData,
          $$IngredientsTableTableFilterComposer,
          $$IngredientsTableTableOrderingComposer,
          $$IngredientsTableTableAnnotationComposer,
          $$IngredientsTableTableCreateCompanionBuilder,
          $$IngredientsTableTableUpdateCompanionBuilder,
          (
            IngredientsTableData,
            BaseReferences<
              _$BackendDatabase,
              $IngredientsTableTable,
              IngredientsTableData
            >,
          ),
          IngredientsTableData,
          PrefetchHooks Function()
        > {
  $$IngredientsTableTableTableManager(
    _$BackendDatabase db,
    $IngredientsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IngredientsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IngredientsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IngredientsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => IngredientsTableCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  IngredientsTableCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$IngredientsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$BackendDatabase,
      $IngredientsTableTable,
      IngredientsTableData,
      $$IngredientsTableTableFilterComposer,
      $$IngredientsTableTableOrderingComposer,
      $$IngredientsTableTableAnnotationComposer,
      $$IngredientsTableTableCreateCompanionBuilder,
      $$IngredientsTableTableUpdateCompanionBuilder,
      (
        IngredientsTableData,
        BaseReferences<
          _$BackendDatabase,
          $IngredientsTableTable,
          IngredientsTableData
        >,
      ),
      IngredientsTableData,
      PrefetchHooks Function()
    >;

class $BackendDatabaseManager {
  final _$BackendDatabase _db;
  $BackendDatabaseManager(this._db);
  $$IngredientsTableTableTableManager get ingredientsTable =>
      $$IngredientsTableTableTableManager(_db, _db.ingredientsTable);
}
