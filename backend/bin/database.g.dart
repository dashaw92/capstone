// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $NamesTableTable extends NamesTable
    with TableInfo<$NamesTableTable, NamesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NamesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
    'item_id',
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
  List<GeneratedColumn> get $columns => [itemId, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'names_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<NamesTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('item_id')) {
      context.handle(
        _itemIdMeta,
        itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta),
      );
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
  Set<GeneratedColumn> get $primaryKey => {itemId};
  @override
  NamesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NamesTableData(
      itemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}item_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $NamesTableTable createAlias(String alias) {
    return $NamesTableTable(attachedDatabase, alias);
  }
}

class NamesTableData extends DataClass implements Insertable<NamesTableData> {
  final int itemId;
  final String name;
  const NamesTableData({required this.itemId, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['item_id'] = Variable<int>(itemId);
    map['name'] = Variable<String>(name);
    return map;
  }

  NamesTableCompanion toCompanion(bool nullToAbsent) {
    return NamesTableCompanion(itemId: Value(itemId), name: Value(name));
  }

  factory NamesTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NamesTableData(
      itemId: serializer.fromJson<int>(json['itemId']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'itemId': serializer.toJson<int>(itemId),
      'name': serializer.toJson<String>(name),
    };
  }

  NamesTableData copyWith({int? itemId, String? name}) =>
      NamesTableData(itemId: itemId ?? this.itemId, name: name ?? this.name);
  NamesTableData copyWithCompanion(NamesTableCompanion data) {
    return NamesTableData(
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NamesTableData(')
          ..write('itemId: $itemId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(itemId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NamesTableData &&
          other.itemId == this.itemId &&
          other.name == this.name);
}

class NamesTableCompanion extends UpdateCompanion<NamesTableData> {
  final Value<int> itemId;
  final Value<String> name;
  const NamesTableCompanion({
    this.itemId = const Value.absent(),
    this.name = const Value.absent(),
  });
  NamesTableCompanion.insert({
    this.itemId = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<NamesTableData> custom({
    Expression<int>? itemId,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (itemId != null) 'item_id': itemId,
      if (name != null) 'name': name,
    });
  }

  NamesTableCompanion copyWith({Value<int>? itemId, Value<String>? name}) {
    return NamesTableCompanion(
      itemId: itemId ?? this.itemId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NamesTableCompanion(')
          ..write('itemId: $itemId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $UpcTableTable extends UpcTable
    with TableInfo<$UpcTableTable, UpcTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UpcTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
    'item_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES names_table (item_id)',
    ),
  );
  static const VerificationMeta _upcMeta = const VerificationMeta('upc');
  @override
  late final GeneratedColumn<String> upc = GeneratedColumn<String>(
    'upc',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 12,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [itemId, upc];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'upc_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<UpcTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('item_id')) {
      context.handle(
        _itemIdMeta,
        itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta),
      );
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('upc')) {
      context.handle(
        _upcMeta,
        upc.isAcceptableOrUnknown(data['upc']!, _upcMeta),
      );
    } else if (isInserting) {
      context.missing(_upcMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UpcTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UpcTableData(
      itemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}item_id'],
      )!,
      upc: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}upc'],
      )!,
    );
  }

  @override
  $UpcTableTable createAlias(String alias) {
    return $UpcTableTable(attachedDatabase, alias);
  }
}

class UpcTableData extends DataClass implements Insertable<UpcTableData> {
  final int itemId;
  final String upc;
  const UpcTableData({required this.itemId, required this.upc});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['item_id'] = Variable<int>(itemId);
    map['upc'] = Variable<String>(upc);
    return map;
  }

  UpcTableCompanion toCompanion(bool nullToAbsent) {
    return UpcTableCompanion(itemId: Value(itemId), upc: Value(upc));
  }

  factory UpcTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UpcTableData(
      itemId: serializer.fromJson<int>(json['itemId']),
      upc: serializer.fromJson<String>(json['upc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'itemId': serializer.toJson<int>(itemId),
      'upc': serializer.toJson<String>(upc),
    };
  }

  UpcTableData copyWith({int? itemId, String? upc}) =>
      UpcTableData(itemId: itemId ?? this.itemId, upc: upc ?? this.upc);
  UpcTableData copyWithCompanion(UpcTableCompanion data) {
    return UpcTableData(
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      upc: data.upc.present ? data.upc.value : this.upc,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UpcTableData(')
          ..write('itemId: $itemId, ')
          ..write('upc: $upc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(itemId, upc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UpcTableData &&
          other.itemId == this.itemId &&
          other.upc == this.upc);
}

class UpcTableCompanion extends UpdateCompanion<UpcTableData> {
  final Value<int> itemId;
  final Value<String> upc;
  final Value<int> rowid;
  const UpcTableCompanion({
    this.itemId = const Value.absent(),
    this.upc = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UpcTableCompanion.insert({
    required int itemId,
    required String upc,
    this.rowid = const Value.absent(),
  }) : itemId = Value(itemId),
       upc = Value(upc);
  static Insertable<UpcTableData> custom({
    Expression<int>? itemId,
    Expression<String>? upc,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (itemId != null) 'item_id': itemId,
      if (upc != null) 'upc': upc,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UpcTableCompanion copyWith({
    Value<int>? itemId,
    Value<String>? upc,
    Value<int>? rowid,
  }) {
    return UpcTableCompanion(
      itemId: itemId ?? this.itemId,
      upc: upc ?? this.upc,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (upc.present) {
      map['upc'] = Variable<String>(upc.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UpcTableCompanion(')
          ..write('itemId: $itemId, ')
          ..write('upc: $upc, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PantryTableTable extends PantryTable
    with TableInfo<$PantryTableTable, PantryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PantryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<int> itemId = GeneratedColumn<int>(
    'item_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES names_table (item_id)',
    ),
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
  List<GeneratedColumn> get $columns => [itemId, amount];
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
    if (data.containsKey('item_id')) {
      context.handle(
        _itemIdMeta,
        itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta),
      );
    } else if (isInserting) {
      context.missing(_itemIdMeta);
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
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PantryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PantryTableData(
      itemId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}item_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
    );
  }

  @override
  $PantryTableTable createAlias(String alias) {
    return $PantryTableTable(attachedDatabase, alias);
  }
}

class PantryTableData extends DataClass implements Insertable<PantryTableData> {
  final int itemId;
  final double amount;
  const PantryTableData({required this.itemId, required this.amount});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['item_id'] = Variable<int>(itemId);
    map['amount'] = Variable<double>(amount);
    return map;
  }

  PantryTableCompanion toCompanion(bool nullToAbsent) {
    return PantryTableCompanion(itemId: Value(itemId), amount: Value(amount));
  }

  factory PantryTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PantryTableData(
      itemId: serializer.fromJson<int>(json['itemId']),
      amount: serializer.fromJson<double>(json['amount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'itemId': serializer.toJson<int>(itemId),
      'amount': serializer.toJson<double>(amount),
    };
  }

  PantryTableData copyWith({int? itemId, double? amount}) => PantryTableData(
    itemId: itemId ?? this.itemId,
    amount: amount ?? this.amount,
  );
  PantryTableData copyWithCompanion(PantryTableCompanion data) {
    return PantryTableData(
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      amount: data.amount.present ? data.amount.value : this.amount,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PantryTableData(')
          ..write('itemId: $itemId, ')
          ..write('amount: $amount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(itemId, amount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PantryTableData &&
          other.itemId == this.itemId &&
          other.amount == this.amount);
}

class PantryTableCompanion extends UpdateCompanion<PantryTableData> {
  final Value<int> itemId;
  final Value<double> amount;
  final Value<int> rowid;
  const PantryTableCompanion({
    this.itemId = const Value.absent(),
    this.amount = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PantryTableCompanion.insert({
    required int itemId,
    required double amount,
    this.rowid = const Value.absent(),
  }) : itemId = Value(itemId),
       amount = Value(amount);
  static Insertable<PantryTableData> custom({
    Expression<int>? itemId,
    Expression<double>? amount,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (itemId != null) 'item_id': itemId,
      if (amount != null) 'amount': amount,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PantryTableCompanion copyWith({
    Value<int>? itemId,
    Value<double>? amount,
    Value<int>? rowid,
  }) {
    return PantryTableCompanion(
      itemId: itemId ?? this.itemId,
      amount: amount ?? this.amount,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (itemId.present) {
      map['item_id'] = Variable<int>(itemId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PantryTableCompanion(')
          ..write('itemId: $itemId, ')
          ..write('amount: $amount, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$BackendDatabase extends GeneratedDatabase {
  _$BackendDatabase(QueryExecutor e) : super(e);
  $BackendDatabaseManager get managers => $BackendDatabaseManager(this);
  late final $NamesTableTable namesTable = $NamesTableTable(this);
  late final $UpcTableTable upcTable = $UpcTableTable(this);
  late final $PantryTableTable pantryTable = $PantryTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    namesTable,
    upcTable,
    pantryTable,
  ];
}

typedef $$NamesTableTableCreateCompanionBuilder =
    NamesTableCompanion Function({Value<int> itemId, required String name});
typedef $$NamesTableTableUpdateCompanionBuilder =
    NamesTableCompanion Function({Value<int> itemId, Value<String> name});

final class $$NamesTableTableReferences
    extends
        BaseReferences<_$BackendDatabase, $NamesTableTable, NamesTableData> {
  $$NamesTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UpcTableTable, List<UpcTableData>>
  _upcTableRefsTable(_$BackendDatabase db) => MultiTypedResultKey.fromTable(
    db.upcTable,
    aliasName: $_aliasNameGenerator(db.namesTable.itemId, db.upcTable.itemId),
  );

  $$UpcTableTableProcessedTableManager get upcTableRefs {
    final manager = $$UpcTableTableTableManager(
      $_db,
      $_db.upcTable,
    ).filter((f) => f.itemId.itemId.sqlEquals($_itemColumn<int>('item_id')!));

    final cache = $_typedResult.readTableOrNull(_upcTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PantryTableTable, List<PantryTableData>>
  _pantryTableRefsTable(_$BackendDatabase db) => MultiTypedResultKey.fromTable(
    db.pantryTable,
    aliasName: $_aliasNameGenerator(
      db.namesTable.itemId,
      db.pantryTable.itemId,
    ),
  );

  $$PantryTableTableProcessedTableManager get pantryTableRefs {
    final manager = $$PantryTableTableTableManager(
      $_db,
      $_db.pantryTable,
    ).filter((f) => f.itemId.itemId.sqlEquals($_itemColumn<int>('item_id')!));

    final cache = $_typedResult.readTableOrNull(_pantryTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$NamesTableTableFilterComposer
    extends Composer<_$BackendDatabase, $NamesTableTable> {
  $$NamesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get itemId => $composableBuilder(
    column: $table.itemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> upcTableRefs(
    Expression<bool> Function($$UpcTableTableFilterComposer f) f,
  ) {
    final $$UpcTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.upcTable,
      getReferencedColumn: (t) => t.itemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UpcTableTableFilterComposer(
            $db: $db,
            $table: $db.upcTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> pantryTableRefs(
    Expression<bool> Function($$PantryTableTableFilterComposer f) f,
  ) {
    final $$PantryTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.pantryTable,
      getReferencedColumn: (t) => t.itemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PantryTableTableFilterComposer(
            $db: $db,
            $table: $db.pantryTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$NamesTableTableOrderingComposer
    extends Composer<_$BackendDatabase, $NamesTableTable> {
  $$NamesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get itemId => $composableBuilder(
    column: $table.itemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NamesTableTableAnnotationComposer
    extends Composer<_$BackendDatabase, $NamesTableTable> {
  $$NamesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get itemId =>
      $composableBuilder(column: $table.itemId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> upcTableRefs<T extends Object>(
    Expression<T> Function($$UpcTableTableAnnotationComposer a) f,
  ) {
    final $$UpcTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.upcTable,
      getReferencedColumn: (t) => t.itemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UpcTableTableAnnotationComposer(
            $db: $db,
            $table: $db.upcTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> pantryTableRefs<T extends Object>(
    Expression<T> Function($$PantryTableTableAnnotationComposer a) f,
  ) {
    final $$PantryTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.pantryTable,
      getReferencedColumn: (t) => t.itemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PantryTableTableAnnotationComposer(
            $db: $db,
            $table: $db.pantryTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$NamesTableTableTableManager
    extends
        RootTableManager<
          _$BackendDatabase,
          $NamesTableTable,
          NamesTableData,
          $$NamesTableTableFilterComposer,
          $$NamesTableTableOrderingComposer,
          $$NamesTableTableAnnotationComposer,
          $$NamesTableTableCreateCompanionBuilder,
          $$NamesTableTableUpdateCompanionBuilder,
          (NamesTableData, $$NamesTableTableReferences),
          NamesTableData,
          PrefetchHooks Function({bool upcTableRefs, bool pantryTableRefs})
        > {
  $$NamesTableTableTableManager(_$BackendDatabase db, $NamesTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NamesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NamesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NamesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> itemId = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => NamesTableCompanion(itemId: itemId, name: name),
          createCompanionCallback:
              ({
                Value<int> itemId = const Value.absent(),
                required String name,
              }) => NamesTableCompanion.insert(itemId: itemId, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$NamesTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({upcTableRefs = false, pantryTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (upcTableRefs) db.upcTable,
                    if (pantryTableRefs) db.pantryTable,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (upcTableRefs)
                        await $_getPrefetchedData<
                          NamesTableData,
                          $NamesTableTable,
                          UpcTableData
                        >(
                          currentTable: table,
                          referencedTable: $$NamesTableTableReferences
                              ._upcTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$NamesTableTableReferences(
                                db,
                                table,
                                p0,
                              ).upcTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.itemId == item.itemId,
                              ),
                          typedResults: items,
                        ),
                      if (pantryTableRefs)
                        await $_getPrefetchedData<
                          NamesTableData,
                          $NamesTableTable,
                          PantryTableData
                        >(
                          currentTable: table,
                          referencedTable: $$NamesTableTableReferences
                              ._pantryTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$NamesTableTableReferences(
                                db,
                                table,
                                p0,
                              ).pantryTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.itemId == item.itemId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$NamesTableTableProcessedTableManager =
    ProcessedTableManager<
      _$BackendDatabase,
      $NamesTableTable,
      NamesTableData,
      $$NamesTableTableFilterComposer,
      $$NamesTableTableOrderingComposer,
      $$NamesTableTableAnnotationComposer,
      $$NamesTableTableCreateCompanionBuilder,
      $$NamesTableTableUpdateCompanionBuilder,
      (NamesTableData, $$NamesTableTableReferences),
      NamesTableData,
      PrefetchHooks Function({bool upcTableRefs, bool pantryTableRefs})
    >;
typedef $$UpcTableTableCreateCompanionBuilder =
    UpcTableCompanion Function({
      required int itemId,
      required String upc,
      Value<int> rowid,
    });
typedef $$UpcTableTableUpdateCompanionBuilder =
    UpcTableCompanion Function({
      Value<int> itemId,
      Value<String> upc,
      Value<int> rowid,
    });

final class $$UpcTableTableReferences
    extends BaseReferences<_$BackendDatabase, $UpcTableTable, UpcTableData> {
  $$UpcTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $NamesTableTable _itemIdTable(_$BackendDatabase db) =>
      db.namesTable.createAlias(
        $_aliasNameGenerator(db.upcTable.itemId, db.namesTable.itemId),
      );

  $$NamesTableTableProcessedTableManager get itemId {
    final $_column = $_itemColumn<int>('item_id')!;

    final manager = $$NamesTableTableTableManager(
      $_db,
      $_db.namesTable,
    ).filter((f) => f.itemId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_itemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$UpcTableTableFilterComposer
    extends Composer<_$BackendDatabase, $UpcTableTable> {
  $$UpcTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get upc => $composableBuilder(
    column: $table.upc,
    builder: (column) => ColumnFilters(column),
  );

  $$NamesTableTableFilterComposer get itemId {
    final $$NamesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.namesTable,
      getReferencedColumn: (t) => t.itemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NamesTableTableFilterComposer(
            $db: $db,
            $table: $db.namesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UpcTableTableOrderingComposer
    extends Composer<_$BackendDatabase, $UpcTableTable> {
  $$UpcTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get upc => $composableBuilder(
    column: $table.upc,
    builder: (column) => ColumnOrderings(column),
  );

  $$NamesTableTableOrderingComposer get itemId {
    final $$NamesTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.namesTable,
      getReferencedColumn: (t) => t.itemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NamesTableTableOrderingComposer(
            $db: $db,
            $table: $db.namesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UpcTableTableAnnotationComposer
    extends Composer<_$BackendDatabase, $UpcTableTable> {
  $$UpcTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get upc =>
      $composableBuilder(column: $table.upc, builder: (column) => column);

  $$NamesTableTableAnnotationComposer get itemId {
    final $$NamesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.namesTable,
      getReferencedColumn: (t) => t.itemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NamesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.namesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UpcTableTableTableManager
    extends
        RootTableManager<
          _$BackendDatabase,
          $UpcTableTable,
          UpcTableData,
          $$UpcTableTableFilterComposer,
          $$UpcTableTableOrderingComposer,
          $$UpcTableTableAnnotationComposer,
          $$UpcTableTableCreateCompanionBuilder,
          $$UpcTableTableUpdateCompanionBuilder,
          (UpcTableData, $$UpcTableTableReferences),
          UpcTableData,
          PrefetchHooks Function({bool itemId})
        > {
  $$UpcTableTableTableManager(_$BackendDatabase db, $UpcTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UpcTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UpcTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UpcTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> itemId = const Value.absent(),
                Value<String> upc = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UpcTableCompanion(itemId: itemId, upc: upc, rowid: rowid),
          createCompanionCallback:
              ({
                required int itemId,
                required String upc,
                Value<int> rowid = const Value.absent(),
              }) => UpcTableCompanion.insert(
                itemId: itemId,
                upc: upc,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$UpcTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({itemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (itemId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.itemId,
                                referencedTable: $$UpcTableTableReferences
                                    ._itemIdTable(db),
                                referencedColumn: $$UpcTableTableReferences
                                    ._itemIdTable(db)
                                    .itemId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$UpcTableTableProcessedTableManager =
    ProcessedTableManager<
      _$BackendDatabase,
      $UpcTableTable,
      UpcTableData,
      $$UpcTableTableFilterComposer,
      $$UpcTableTableOrderingComposer,
      $$UpcTableTableAnnotationComposer,
      $$UpcTableTableCreateCompanionBuilder,
      $$UpcTableTableUpdateCompanionBuilder,
      (UpcTableData, $$UpcTableTableReferences),
      UpcTableData,
      PrefetchHooks Function({bool itemId})
    >;
typedef $$PantryTableTableCreateCompanionBuilder =
    PantryTableCompanion Function({
      required int itemId,
      required double amount,
      Value<int> rowid,
    });
typedef $$PantryTableTableUpdateCompanionBuilder =
    PantryTableCompanion Function({
      Value<int> itemId,
      Value<double> amount,
      Value<int> rowid,
    });

final class $$PantryTableTableReferences
    extends
        BaseReferences<_$BackendDatabase, $PantryTableTable, PantryTableData> {
  $$PantryTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $NamesTableTable _itemIdTable(_$BackendDatabase db) =>
      db.namesTable.createAlias(
        $_aliasNameGenerator(db.pantryTable.itemId, db.namesTable.itemId),
      );

  $$NamesTableTableProcessedTableManager get itemId {
    final $_column = $_itemColumn<int>('item_id')!;

    final manager = $$NamesTableTableTableManager(
      $_db,
      $_db.namesTable,
    ).filter((f) => f.itemId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_itemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PantryTableTableFilterComposer
    extends Composer<_$BackendDatabase, $PantryTableTable> {
  $$PantryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  $$NamesTableTableFilterComposer get itemId {
    final $$NamesTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.namesTable,
      getReferencedColumn: (t) => t.itemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NamesTableTableFilterComposer(
            $db: $db,
            $table: $db.namesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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
  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  $$NamesTableTableOrderingComposer get itemId {
    final $$NamesTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.namesTable,
      getReferencedColumn: (t) => t.itemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NamesTableTableOrderingComposer(
            $db: $db,
            $table: $db.namesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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
  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  $$NamesTableTableAnnotationComposer get itemId {
    final $$NamesTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.namesTable,
      getReferencedColumn: (t) => t.itemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NamesTableTableAnnotationComposer(
            $db: $db,
            $table: $db.namesTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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
          (PantryTableData, $$PantryTableTableReferences),
          PantryTableData,
          PrefetchHooks Function({bool itemId})
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
                Value<int> itemId = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PantryTableCompanion(
                itemId: itemId,
                amount: amount,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int itemId,
                required double amount,
                Value<int> rowid = const Value.absent(),
              }) => PantryTableCompanion.insert(
                itemId: itemId,
                amount: amount,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PantryTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({itemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (itemId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.itemId,
                                referencedTable: $$PantryTableTableReferences
                                    ._itemIdTable(db),
                                referencedColumn: $$PantryTableTableReferences
                                    ._itemIdTable(db)
                                    .itemId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
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
      (PantryTableData, $$PantryTableTableReferences),
      PantryTableData,
      PrefetchHooks Function({bool itemId})
    >;

class $BackendDatabaseManager {
  final _$BackendDatabase _db;
  $BackendDatabaseManager(this._db);
  $$NamesTableTableTableManager get namesTable =>
      $$NamesTableTableTableManager(_db, _db.namesTable);
  $$UpcTableTableTableManager get upcTable =>
      $$UpcTableTableTableManager(_db, _db.upcTable);
  $$PantryTableTableTableManager get pantryTable =>
      $$PantryTableTableTableManager(_db, _db.pantryTable);
}
