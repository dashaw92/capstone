// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $PantryTableTable extends PantryTable
    with TableInfo<$PantryTableTable, PantryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PantryTableTable(this.attachedDatabase, [this._alias]);
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
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<Unit, String> unit =
      GeneratedColumn<String>(
        'unit',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Unit>($PantryTableTable.$converterunit);
  @override
  List<GeneratedColumn> get $columns => [id, name, amount, unit];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pantry_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PantryTableData> instance, {
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
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PantryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PantryTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      unit: $PantryTableTable.$converterunit.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}unit'],
        )!,
      ),
    );
  }

  @override
  $PantryTableTable createAlias(String alias) {
    return $PantryTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<Unit, String, String> $converterunit =
      const EnumNameConverter<Unit>(Unit.values);
}

class PantryTableData extends DataClass implements Insertable<PantryTableData> {
  final int id;
  final String name;
  final double amount;
  final Unit unit;
  const PantryTableData({
    required this.id,
    required this.name,
    required this.amount,
    required this.unit,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['amount'] = Variable<double>(amount);
    {
      map['unit'] = Variable<String>(
        $PantryTableTable.$converterunit.toSql(unit),
      );
    }
    return map;
  }

  PantryTableCompanion toCompanion(bool nullToAbsent) {
    return PantryTableCompanion(
      id: Value(id),
      name: Value(name),
      amount: Value(amount),
      unit: Value(unit),
    );
  }

  factory PantryTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PantryTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      amount: serializer.fromJson<double>(json['amount']),
      unit: $PantryTableTable.$converterunit.fromJson(
        serializer.fromJson<String>(json['unit']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'amount': serializer.toJson<double>(amount),
      'unit': serializer.toJson<String>(
        $PantryTableTable.$converterunit.toJson(unit),
      ),
    };
  }

  PantryTableData copyWith({
    int? id,
    String? name,
    double? amount,
    Unit? unit,
  }) => PantryTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    amount: amount ?? this.amount,
    unit: unit ?? this.unit,
  );
  PantryTableData copyWithCompanion(PantryTableCompanion data) {
    return PantryTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      amount: data.amount.present ? data.amount.value : this.amount,
      unit: data.unit.present ? data.unit.value : this.unit,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PantryTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('amount: $amount, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, amount, unit);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PantryTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.amount == this.amount &&
          other.unit == this.unit);
}

class PantryTableCompanion extends UpdateCompanion<PantryTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> amount;
  final Value<Unit> unit;
  const PantryTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.amount = const Value.absent(),
    this.unit = const Value.absent(),
  });
  PantryTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double amount,
    required Unit unit,
  }) : name = Value(name),
       amount = Value(amount),
       unit = Value(unit);
  static Insertable<PantryTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? amount,
    Expression<String>? unit,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (amount != null) 'amount': amount,
      if (unit != null) 'unit': unit,
    });
  }

  PantryTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<double>? amount,
    Value<Unit>? unit,
  }) {
    return PantryTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      unit: unit ?? this.unit,
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
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(
        $PantryTableTable.$converterunit.toSql(unit.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PantryTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('amount: $amount, ')
          ..write('unit: $unit')
          ..write(')'))
        .toString();
  }
}

abstract class _$BackendDatabase extends GeneratedDatabase {
  _$BackendDatabase(QueryExecutor e) : super(e);
  $BackendDatabaseManager get managers => $BackendDatabaseManager(this);
  late final $PantryTableTable pantryTable = $PantryTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [pantryTable];
}

typedef $$PantryTableTableCreateCompanionBuilder =
    PantryTableCompanion Function({
      Value<int> id,
      required String name,
      required double amount,
      required Unit unit,
    });
typedef $$PantryTableTableUpdateCompanionBuilder =
    PantryTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<double> amount,
      Value<Unit> unit,
    });

class $$PantryTableTableFilterComposer
    extends Composer<_$BackendDatabase, $PantryTableTable> {
  $$PantryTableTableFilterComposer({
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

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Unit, Unit, String> get unit =>
      $composableBuilder(
        column: $table.unit,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );
}

class $$PantryTableTableOrderingComposer
    extends Composer<_$BackendDatabase, $PantryTableTable> {
  $$PantryTableTableOrderingComposer({
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

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PantryTableTableAnnotationComposer
    extends Composer<_$BackendDatabase, $PantryTableTable> {
  $$PantryTableTableAnnotationComposer({
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

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Unit, String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);
}

class $$PantryTableTableTableManager
    extends
        RootTableManager<
          _$BackendDatabase,
          $PantryTableTable,
          PantryTableData,
          $$PantryTableTableFilterComposer,
          $$PantryTableTableOrderingComposer,
          $$PantryTableTableAnnotationComposer,
          $$PantryTableTableCreateCompanionBuilder,
          $$PantryTableTableUpdateCompanionBuilder,
          (
            PantryTableData,
            BaseReferences<
              _$BackendDatabase,
              $PantryTableTable,
              PantryTableData
            >,
          ),
          PantryTableData,
          PrefetchHooks Function()
        > {
  $$PantryTableTableTableManager(_$BackendDatabase db, $PantryTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PantryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PantryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PantryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<Unit> unit = const Value.absent(),
              }) => PantryTableCompanion(
                id: id,
                name: name,
                amount: amount,
                unit: unit,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required double amount,
                required Unit unit,
              }) => PantryTableCompanion.insert(
                id: id,
                name: name,
                amount: amount,
                unit: unit,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PantryTableTableProcessedTableManager =
    ProcessedTableManager<
      _$BackendDatabase,
      $PantryTableTable,
      PantryTableData,
      $$PantryTableTableFilterComposer,
      $$PantryTableTableOrderingComposer,
      $$PantryTableTableAnnotationComposer,
      $$PantryTableTableCreateCompanionBuilder,
      $$PantryTableTableUpdateCompanionBuilder,
      (
        PantryTableData,
        BaseReferences<_$BackendDatabase, $PantryTableTable, PantryTableData>,
      ),
      PantryTableData,
      PrefetchHooks Function()
    >;

class $BackendDatabaseManager {
  final _$BackendDatabase _db;
  $BackendDatabaseManager(this._db);
  $$PantryTableTableTableManager get pantryTable =>
      $$PantryTableTableTableManager(_db, _db.pantryTable);
}
