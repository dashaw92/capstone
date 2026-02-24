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
  List<GeneratedColumn> get $columns => [id, name, amount];
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
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
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
  final double amount;
  const IngredientsTableData({
    required this.id,
    required this.name,
    required this.amount,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['amount'] = Variable<double>(amount);
    return map;
  }

  IngredientsTableCompanion toCompanion(bool nullToAbsent) {
    return IngredientsTableCompanion(
      id: Value(id),
      name: Value(name),
      amount: Value(amount),
    );
  }

  factory IngredientsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IngredientsTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'amount': serializer.toJson<double>(amount),
    };
  }

  IngredientsTableData copyWith({int? id, String? name, double? amount}) =>
      IngredientsTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        amount: amount ?? this.amount,
      );
  IngredientsTableData copyWithCompanion(IngredientsTableCompanion data) {
    return IngredientsTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IngredientsTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IngredientsTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.amount == this.amount);
}

class IngredientsTableCompanion extends UpdateCompanion<IngredientsTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<double> amount;
  const IngredientsTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.amount = const Value.absent(),
  });
  IngredientsTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required double amount,
  }) : name = Value(name),
       amount = Value(amount);
  static Insertable<IngredientsTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? amount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (amount != null) 'amount': amount,
    });
  }

  IngredientsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<double>? amount,
  }) {
    return IngredientsTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      amount: amount ?? this.amount,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IngredientsTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }
}

class $ExtractorsTableTable extends ExtractorsTable
    with TableInfo<$ExtractorsTableTable, ExtractorsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExtractorsTableTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
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
  static const VerificationMeta _scriptMeta = const VerificationMeta('script');
  @override
  late final GeneratedColumn<String> script = GeneratedColumn<String>(
    'script',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, label, script];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'extractors_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ExtractorsTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('script')) {
      context.handle(
        _scriptMeta,
        script.isAcceptableOrUnknown(data['script']!, _scriptMeta),
      );
    } else if (isInserting) {
      context.missing(_scriptMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExtractorsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExtractorsTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      script: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}script'],
      )!,
    );
  }

  @override
  $ExtractorsTableTable createAlias(String alias) {
    return $ExtractorsTableTable(attachedDatabase, alias);
  }
}

class ExtractorsTableData extends DataClass
    implements Insertable<ExtractorsTableData> {
  final int id;
  final String label;
  final String script;
  const ExtractorsTableData({
    required this.id,
    required this.label,
    required this.script,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['label'] = Variable<String>(label);
    map['script'] = Variable<String>(script);
    return map;
  }

  ExtractorsTableCompanion toCompanion(bool nullToAbsent) {
    return ExtractorsTableCompanion(
      id: Value(id),
      label: Value(label),
      script: Value(script),
    );
  }

  factory ExtractorsTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExtractorsTableData(
      id: serializer.fromJson<int>(json['id']),
      label: serializer.fromJson<String>(json['label']),
      script: serializer.fromJson<String>(json['script']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'label': serializer.toJson<String>(label),
      'script': serializer.toJson<String>(script),
    };
  }

  ExtractorsTableData copyWith({int? id, String? label, String? script}) =>
      ExtractorsTableData(
        id: id ?? this.id,
        label: label ?? this.label,
        script: script ?? this.script,
      );
  ExtractorsTableData copyWithCompanion(ExtractorsTableCompanion data) {
    return ExtractorsTableData(
      id: data.id.present ? data.id.value : this.id,
      label: data.label.present ? data.label.value : this.label,
      script: data.script.present ? data.script.value : this.script,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExtractorsTableData(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('script: $script')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, label, script);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExtractorsTableData &&
          other.id == this.id &&
          other.label == this.label &&
          other.script == this.script);
}

class ExtractorsTableCompanion extends UpdateCompanion<ExtractorsTableData> {
  final Value<int> id;
  final Value<String> label;
  final Value<String> script;
  const ExtractorsTableCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
    this.script = const Value.absent(),
  });
  ExtractorsTableCompanion.insert({
    this.id = const Value.absent(),
    required String label,
    required String script,
  }) : label = Value(label),
       script = Value(script);
  static Insertable<ExtractorsTableData> custom({
    Expression<int>? id,
    Expression<String>? label,
    Expression<String>? script,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
      if (script != null) 'script': script,
    });
  }

  ExtractorsTableCompanion copyWith({
    Value<int>? id,
    Value<String>? label,
    Value<String>? script,
  }) {
    return ExtractorsTableCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
      script: script ?? this.script,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (script.present) {
      map['script'] = Variable<String>(script.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExtractorsTableCompanion(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('script: $script')
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
  late final $ExtractorsTableTable extractorsTable = $ExtractorsTableTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    ingredientsTable,
    extractorsTable,
  ];
}

typedef $$IngredientsTableTableCreateCompanionBuilder =
    IngredientsTableCompanion Function({
      Value<int> id,
      required String name,
      required double amount,
    });
typedef $$IngredientsTableTableUpdateCompanionBuilder =
    IngredientsTableCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<double> amount,
    });

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

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
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

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
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

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);
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
                Value<double> amount = const Value.absent(),
              }) =>
                  IngredientsTableCompanion(id: id, name: name, amount: amount),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required double amount,
              }) => IngredientsTableCompanion.insert(
                id: id,
                name: name,
                amount: amount,
              ),
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
typedef $$ExtractorsTableTableCreateCompanionBuilder =
    ExtractorsTableCompanion Function({
      Value<int> id,
      required String label,
      required String script,
    });
typedef $$ExtractorsTableTableUpdateCompanionBuilder =
    ExtractorsTableCompanion Function({
      Value<int> id,
      Value<String> label,
      Value<String> script,
    });

class $$ExtractorsTableTableFilterComposer
    extends Composer<_$BackendDatabase, $ExtractorsTableTable> {
  $$ExtractorsTableTableFilterComposer({
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

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get script => $composableBuilder(
    column: $table.script,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ExtractorsTableTableOrderingComposer
    extends Composer<_$BackendDatabase, $ExtractorsTableTable> {
  $$ExtractorsTableTableOrderingComposer({
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

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get script => $composableBuilder(
    column: $table.script,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ExtractorsTableTableAnnotationComposer
    extends Composer<_$BackendDatabase, $ExtractorsTableTable> {
  $$ExtractorsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get script =>
      $composableBuilder(column: $table.script, builder: (column) => column);
}

class $$ExtractorsTableTableTableManager
    extends
        RootTableManager<
          _$BackendDatabase,
          $ExtractorsTableTable,
          ExtractorsTableData,
          $$ExtractorsTableTableFilterComposer,
          $$ExtractorsTableTableOrderingComposer,
          $$ExtractorsTableTableAnnotationComposer,
          $$ExtractorsTableTableCreateCompanionBuilder,
          $$ExtractorsTableTableUpdateCompanionBuilder,
          (
            ExtractorsTableData,
            BaseReferences<
              _$BackendDatabase,
              $ExtractorsTableTable,
              ExtractorsTableData
            >,
          ),
          ExtractorsTableData,
          PrefetchHooks Function()
        > {
  $$ExtractorsTableTableTableManager(
    _$BackendDatabase db,
    $ExtractorsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExtractorsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExtractorsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExtractorsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<String> script = const Value.absent(),
              }) => ExtractorsTableCompanion(
                id: id,
                label: label,
                script: script,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String label,
                required String script,
              }) => ExtractorsTableCompanion.insert(
                id: id,
                label: label,
                script: script,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ExtractorsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$BackendDatabase,
      $ExtractorsTableTable,
      ExtractorsTableData,
      $$ExtractorsTableTableFilterComposer,
      $$ExtractorsTableTableOrderingComposer,
      $$ExtractorsTableTableAnnotationComposer,
      $$ExtractorsTableTableCreateCompanionBuilder,
      $$ExtractorsTableTableUpdateCompanionBuilder,
      (
        ExtractorsTableData,
        BaseReferences<
          _$BackendDatabase,
          $ExtractorsTableTable,
          ExtractorsTableData
        >,
      ),
      ExtractorsTableData,
      PrefetchHooks Function()
    >;

class $BackendDatabaseManager {
  final _$BackendDatabase _db;
  $BackendDatabaseManager(this._db);
  $$IngredientsTableTableTableManager get ingredientsTable =>
      $$IngredientsTableTableTableManager(_db, _db.ingredientsTable);
  $$ExtractorsTableTableTableManager get extractorsTable =>
      $$ExtractorsTableTableTableManager(_db, _db.extractorsTable);
}
