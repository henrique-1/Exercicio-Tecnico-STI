// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $MarcasTableTable extends MarcasTable
    with TableInfo<$MarcasTableTable, MarcaEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MarcasTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'MAR_ID',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'MAR_NOME',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, nome];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'MARCAS';
  @override
  VerificationContext validateIntegrity(
    Insertable<MarcaEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('MAR_ID')) {
      context.handle(
        _idMeta,
        id.isAcceptableOrUnknown(data['MAR_ID']!, _idMeta),
      );
    }
    if (data.containsKey('MAR_NOME')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['MAR_NOME']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MarcaEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MarcaEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}MAR_ID'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}MAR_NOME'],
      )!,
    );
  }

  @override
  $MarcasTableTable createAlias(String alias) {
    return $MarcasTableTable(attachedDatabase, alias);
  }
}

class MarcaEntity extends DataClass implements Insertable<MarcaEntity> {
  final int id;
  final String nome;
  const MarcaEntity({required this.id, required this.nome});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['MAR_ID'] = Variable<int>(id);
    map['MAR_NOME'] = Variable<String>(nome);
    return map;
  }

  MarcasTableCompanion toCompanion(bool nullToAbsent) {
    return MarcasTableCompanion(id: Value(id), nome: Value(nome));
  }

  factory MarcaEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MarcaEntity(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
    };
  }

  MarcaEntity copyWith({int? id, String? nome}) =>
      MarcaEntity(id: id ?? this.id, nome: nome ?? this.nome);
  MarcaEntity copyWithCompanion(MarcasTableCompanion data) {
    return MarcaEntity(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MarcaEntity(')
          ..write('id: $id, ')
          ..write('nome: $nome')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MarcaEntity && other.id == this.id && other.nome == this.nome);
}

class MarcasTableCompanion extends UpdateCompanion<MarcaEntity> {
  final Value<int> id;
  final Value<String> nome;
  const MarcasTableCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
  });
  MarcasTableCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
  }) : nome = Value(nome);
  static Insertable<MarcaEntity> custom({
    Expression<int>? id,
    Expression<String>? nome,
  }) {
    return RawValuesInsertable({
      if (id != null) 'MAR_ID': id,
      if (nome != null) 'MAR_NOME': nome,
    });
  }

  MarcasTableCompanion copyWith({Value<int>? id, Value<String>? nome}) {
    return MarcasTableCompanion(id: id ?? this.id, nome: nome ?? this.nome);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['MAR_ID'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['MAR_NOME'] = Variable<String>(nome.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MarcasTableCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome')
          ..write(')'))
        .toString();
  }
}

class $ModelosTableTable extends ModelosTable
    with TableInfo<$ModelosTableTable, ModeloEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ModelosTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'MOD_ID',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nomeMeta = const VerificationMeta('nome');
  @override
  late final GeneratedColumn<String> nome = GeneratedColumn<String>(
    'MOD_NOME',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _marcaIdMeta = const VerificationMeta(
    'marcaId',
  );
  @override
  late final GeneratedColumn<int> marcaId = GeneratedColumn<int>(
    'FK_MARCAS_MAR_ID',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES MARCAS (MAR_ID) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, nome, marcaId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'MODELOS';
  @override
  VerificationContext validateIntegrity(
    Insertable<ModeloEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('MOD_ID')) {
      context.handle(
        _idMeta,
        id.isAcceptableOrUnknown(data['MOD_ID']!, _idMeta),
      );
    }
    if (data.containsKey('MOD_NOME')) {
      context.handle(
        _nomeMeta,
        nome.isAcceptableOrUnknown(data['MOD_NOME']!, _nomeMeta),
      );
    } else if (isInserting) {
      context.missing(_nomeMeta);
    }
    if (data.containsKey('FK_MARCAS_MAR_ID')) {
      context.handle(
        _marcaIdMeta,
        marcaId.isAcceptableOrUnknown(data['FK_MARCAS_MAR_ID']!, _marcaIdMeta),
      );
    } else if (isInserting) {
      context.missing(_marcaIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ModeloEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ModeloEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}MOD_ID'],
      )!,
      nome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}MOD_NOME'],
      )!,
      marcaId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}FK_MARCAS_MAR_ID'],
      )!,
    );
  }

  @override
  $ModelosTableTable createAlias(String alias) {
    return $ModelosTableTable(attachedDatabase, alias);
  }
}

class ModeloEntity extends DataClass implements Insertable<ModeloEntity> {
  final int id;
  final String nome;
  final int marcaId;
  const ModeloEntity({
    required this.id,
    required this.nome,
    required this.marcaId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['MOD_ID'] = Variable<int>(id);
    map['MOD_NOME'] = Variable<String>(nome);
    map['FK_MARCAS_MAR_ID'] = Variable<int>(marcaId);
    return map;
  }

  ModelosTableCompanion toCompanion(bool nullToAbsent) {
    return ModelosTableCompanion(
      id: Value(id),
      nome: Value(nome),
      marcaId: Value(marcaId),
    );
  }

  factory ModeloEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ModeloEntity(
      id: serializer.fromJson<int>(json['id']),
      nome: serializer.fromJson<String>(json['nome']),
      marcaId: serializer.fromJson<int>(json['marcaId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nome': serializer.toJson<String>(nome),
      'marcaId': serializer.toJson<int>(marcaId),
    };
  }

  ModeloEntity copyWith({int? id, String? nome, int? marcaId}) => ModeloEntity(
    id: id ?? this.id,
    nome: nome ?? this.nome,
    marcaId: marcaId ?? this.marcaId,
  );
  ModeloEntity copyWithCompanion(ModelosTableCompanion data) {
    return ModeloEntity(
      id: data.id.present ? data.id.value : this.id,
      nome: data.nome.present ? data.nome.value : this.nome,
      marcaId: data.marcaId.present ? data.marcaId.value : this.marcaId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ModeloEntity(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('marcaId: $marcaId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, nome, marcaId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ModeloEntity &&
          other.id == this.id &&
          other.nome == this.nome &&
          other.marcaId == this.marcaId);
}

class ModelosTableCompanion extends UpdateCompanion<ModeloEntity> {
  final Value<int> id;
  final Value<String> nome;
  final Value<int> marcaId;
  const ModelosTableCompanion({
    this.id = const Value.absent(),
    this.nome = const Value.absent(),
    this.marcaId = const Value.absent(),
  });
  ModelosTableCompanion.insert({
    this.id = const Value.absent(),
    required String nome,
    required int marcaId,
  }) : nome = Value(nome),
       marcaId = Value(marcaId);
  static Insertable<ModeloEntity> custom({
    Expression<int>? id,
    Expression<String>? nome,
    Expression<int>? marcaId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'MOD_ID': id,
      if (nome != null) 'MOD_NOME': nome,
      if (marcaId != null) 'FK_MARCAS_MAR_ID': marcaId,
    });
  }

  ModelosTableCompanion copyWith({
    Value<int>? id,
    Value<String>? nome,
    Value<int>? marcaId,
  }) {
    return ModelosTableCompanion(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      marcaId: marcaId ?? this.marcaId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['MOD_ID'] = Variable<int>(id.value);
    }
    if (nome.present) {
      map['MOD_NOME'] = Variable<String>(nome.value);
    }
    if (marcaId.present) {
      map['FK_MARCAS_MAR_ID'] = Variable<int>(marcaId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ModelosTableCompanion(')
          ..write('id: $id, ')
          ..write('nome: $nome, ')
          ..write('marcaId: $marcaId')
          ..write(')'))
        .toString();
  }
}

class $CarrosTableTable extends CarrosTable
    with TableInfo<$CarrosTableTable, CarroEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CarrosTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'CAR_ID',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _placaMeta = const VerificationMeta('placa');
  @override
  late final GeneratedColumn<String> placa = GeneratedColumn<String>(
    'CAR_PLACA',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 7,
      maxTextLength: 10,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _corMeta = const VerificationMeta('cor');
  @override
  late final GeneratedColumn<String> cor = GeneratedColumn<String>(
    'CAR_COR',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 30,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _anoMeta = const VerificationMeta('ano');
  @override
  late final GeneratedColumn<int> ano = GeneratedColumn<int>(
    'CAR_ANO',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _porteMeta = const VerificationMeta('porte');
  @override
  late final GeneratedColumn<String> porte = GeneratedColumn<String>(
    'CAR_PORTE',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tipoCargaMeta = const VerificationMeta(
    'tipoCarga',
  );
  @override
  late final GeneratedColumn<String> tipoCarga = GeneratedColumn<String>(
    'CAR_TIPO_CARGA',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 30,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _chassisMeta = const VerificationMeta(
    'chassis',
  );
  @override
  late final GeneratedColumn<String> chassis = GeneratedColumn<String>(
    'CAR_CHASSIS',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 17,
      maxTextLength: 17,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _modeloIdMeta = const VerificationMeta(
    'modeloId',
  );
  @override
  late final GeneratedColumn<int> modeloId = GeneratedColumn<int>(
    'FK_MODELOS_MOD_ID',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES MODELOS (MOD_ID) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    placa,
    cor,
    ano,
    porte,
    tipoCarga,
    chassis,
    modeloId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'CARROS';
  @override
  VerificationContext validateIntegrity(
    Insertable<CarroEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('CAR_ID')) {
      context.handle(
        _idMeta,
        id.isAcceptableOrUnknown(data['CAR_ID']!, _idMeta),
      );
    }
    if (data.containsKey('CAR_PLACA')) {
      context.handle(
        _placaMeta,
        placa.isAcceptableOrUnknown(data['CAR_PLACA']!, _placaMeta),
      );
    } else if (isInserting) {
      context.missing(_placaMeta);
    }
    if (data.containsKey('CAR_COR')) {
      context.handle(
        _corMeta,
        cor.isAcceptableOrUnknown(data['CAR_COR']!, _corMeta),
      );
    } else if (isInserting) {
      context.missing(_corMeta);
    }
    if (data.containsKey('CAR_ANO')) {
      context.handle(
        _anoMeta,
        ano.isAcceptableOrUnknown(data['CAR_ANO']!, _anoMeta),
      );
    } else if (isInserting) {
      context.missing(_anoMeta);
    }
    if (data.containsKey('CAR_PORTE')) {
      context.handle(
        _porteMeta,
        porte.isAcceptableOrUnknown(data['CAR_PORTE']!, _porteMeta),
      );
    } else if (isInserting) {
      context.missing(_porteMeta);
    }
    if (data.containsKey('CAR_TIPO_CARGA')) {
      context.handle(
        _tipoCargaMeta,
        tipoCarga.isAcceptableOrUnknown(
          data['CAR_TIPO_CARGA']!,
          _tipoCargaMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_tipoCargaMeta);
    }
    if (data.containsKey('CAR_CHASSIS')) {
      context.handle(
        _chassisMeta,
        chassis.isAcceptableOrUnknown(data['CAR_CHASSIS']!, _chassisMeta),
      );
    } else if (isInserting) {
      context.missing(_chassisMeta);
    }
    if (data.containsKey('FK_MODELOS_MOD_ID')) {
      context.handle(
        _modeloIdMeta,
        modeloId.isAcceptableOrUnknown(
          data['FK_MODELOS_MOD_ID']!,
          _modeloIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_modeloIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CarroEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CarroEntity(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}CAR_ID'],
      )!,
      placa: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CAR_PLACA'],
      )!,
      cor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CAR_COR'],
      )!,
      ano: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}CAR_ANO'],
      )!,
      porte: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CAR_PORTE'],
      )!,
      tipoCarga: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CAR_TIPO_CARGA'],
      )!,
      chassis: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}CAR_CHASSIS'],
      )!,
      modeloId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}FK_MODELOS_MOD_ID'],
      )!,
    );
  }

  @override
  $CarrosTableTable createAlias(String alias) {
    return $CarrosTableTable(attachedDatabase, alias);
  }
}

class CarroEntity extends DataClass implements Insertable<CarroEntity> {
  final int id;
  final String placa;
  final String cor;
  final int ano;
  final String porte;
  final String tipoCarga;
  final String chassis;
  final int modeloId;
  const CarroEntity({
    required this.id,
    required this.placa,
    required this.cor,
    required this.ano,
    required this.porte,
    required this.tipoCarga,
    required this.chassis,
    required this.modeloId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['CAR_ID'] = Variable<int>(id);
    map['CAR_PLACA'] = Variable<String>(placa);
    map['CAR_COR'] = Variable<String>(cor);
    map['CAR_ANO'] = Variable<int>(ano);
    map['CAR_PORTE'] = Variable<String>(porte);
    map['CAR_TIPO_CARGA'] = Variable<String>(tipoCarga);
    map['CAR_CHASSIS'] = Variable<String>(chassis);
    map['FK_MODELOS_MOD_ID'] = Variable<int>(modeloId);
    return map;
  }

  CarrosTableCompanion toCompanion(bool nullToAbsent) {
    return CarrosTableCompanion(
      id: Value(id),
      placa: Value(placa),
      cor: Value(cor),
      ano: Value(ano),
      porte: Value(porte),
      tipoCarga: Value(tipoCarga),
      chassis: Value(chassis),
      modeloId: Value(modeloId),
    );
  }

  factory CarroEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CarroEntity(
      id: serializer.fromJson<int>(json['id']),
      placa: serializer.fromJson<String>(json['placa']),
      cor: serializer.fromJson<String>(json['cor']),
      ano: serializer.fromJson<int>(json['ano']),
      porte: serializer.fromJson<String>(json['porte']),
      tipoCarga: serializer.fromJson<String>(json['tipoCarga']),
      chassis: serializer.fromJson<String>(json['chassis']),
      modeloId: serializer.fromJson<int>(json['modeloId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'placa': serializer.toJson<String>(placa),
      'cor': serializer.toJson<String>(cor),
      'ano': serializer.toJson<int>(ano),
      'porte': serializer.toJson<String>(porte),
      'tipoCarga': serializer.toJson<String>(tipoCarga),
      'chassis': serializer.toJson<String>(chassis),
      'modeloId': serializer.toJson<int>(modeloId),
    };
  }

  CarroEntity copyWith({
    int? id,
    String? placa,
    String? cor,
    int? ano,
    String? porte,
    String? tipoCarga,
    String? chassis,
    int? modeloId,
  }) => CarroEntity(
    id: id ?? this.id,
    placa: placa ?? this.placa,
    cor: cor ?? this.cor,
    ano: ano ?? this.ano,
    porte: porte ?? this.porte,
    tipoCarga: tipoCarga ?? this.tipoCarga,
    chassis: chassis ?? this.chassis,
    modeloId: modeloId ?? this.modeloId,
  );
  CarroEntity copyWithCompanion(CarrosTableCompanion data) {
    return CarroEntity(
      id: data.id.present ? data.id.value : this.id,
      placa: data.placa.present ? data.placa.value : this.placa,
      cor: data.cor.present ? data.cor.value : this.cor,
      ano: data.ano.present ? data.ano.value : this.ano,
      porte: data.porte.present ? data.porte.value : this.porte,
      tipoCarga: data.tipoCarga.present ? data.tipoCarga.value : this.tipoCarga,
      chassis: data.chassis.present ? data.chassis.value : this.chassis,
      modeloId: data.modeloId.present ? data.modeloId.value : this.modeloId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CarroEntity(')
          ..write('id: $id, ')
          ..write('placa: $placa, ')
          ..write('cor: $cor, ')
          ..write('ano: $ano, ')
          ..write('porte: $porte, ')
          ..write('tipoCarga: $tipoCarga, ')
          ..write('chassis: $chassis, ')
          ..write('modeloId: $modeloId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, placa, cor, ano, porte, tipoCarga, chassis, modeloId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CarroEntity &&
          other.id == this.id &&
          other.placa == this.placa &&
          other.cor == this.cor &&
          other.ano == this.ano &&
          other.porte == this.porte &&
          other.tipoCarga == this.tipoCarga &&
          other.chassis == this.chassis &&
          other.modeloId == this.modeloId);
}

class CarrosTableCompanion extends UpdateCompanion<CarroEntity> {
  final Value<int> id;
  final Value<String> placa;
  final Value<String> cor;
  final Value<int> ano;
  final Value<String> porte;
  final Value<String> tipoCarga;
  final Value<String> chassis;
  final Value<int> modeloId;
  const CarrosTableCompanion({
    this.id = const Value.absent(),
    this.placa = const Value.absent(),
    this.cor = const Value.absent(),
    this.ano = const Value.absent(),
    this.porte = const Value.absent(),
    this.tipoCarga = const Value.absent(),
    this.chassis = const Value.absent(),
    this.modeloId = const Value.absent(),
  });
  CarrosTableCompanion.insert({
    this.id = const Value.absent(),
    required String placa,
    required String cor,
    required int ano,
    required String porte,
    required String tipoCarga,
    required String chassis,
    required int modeloId,
  }) : placa = Value(placa),
       cor = Value(cor),
       ano = Value(ano),
       porte = Value(porte),
       tipoCarga = Value(tipoCarga),
       chassis = Value(chassis),
       modeloId = Value(modeloId);
  static Insertable<CarroEntity> custom({
    Expression<int>? id,
    Expression<String>? placa,
    Expression<String>? cor,
    Expression<int>? ano,
    Expression<String>? porte,
    Expression<String>? tipoCarga,
    Expression<String>? chassis,
    Expression<int>? modeloId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'CAR_ID': id,
      if (placa != null) 'CAR_PLACA': placa,
      if (cor != null) 'CAR_COR': cor,
      if (ano != null) 'CAR_ANO': ano,
      if (porte != null) 'CAR_PORTE': porte,
      if (tipoCarga != null) 'CAR_TIPO_CARGA': tipoCarga,
      if (chassis != null) 'CAR_CHASSIS': chassis,
      if (modeloId != null) 'FK_MODELOS_MOD_ID': modeloId,
    });
  }

  CarrosTableCompanion copyWith({
    Value<int>? id,
    Value<String>? placa,
    Value<String>? cor,
    Value<int>? ano,
    Value<String>? porte,
    Value<String>? tipoCarga,
    Value<String>? chassis,
    Value<int>? modeloId,
  }) {
    return CarrosTableCompanion(
      id: id ?? this.id,
      placa: placa ?? this.placa,
      cor: cor ?? this.cor,
      ano: ano ?? this.ano,
      porte: porte ?? this.porte,
      tipoCarga: tipoCarga ?? this.tipoCarga,
      chassis: chassis ?? this.chassis,
      modeloId: modeloId ?? this.modeloId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['CAR_ID'] = Variable<int>(id.value);
    }
    if (placa.present) {
      map['CAR_PLACA'] = Variable<String>(placa.value);
    }
    if (cor.present) {
      map['CAR_COR'] = Variable<String>(cor.value);
    }
    if (ano.present) {
      map['CAR_ANO'] = Variable<int>(ano.value);
    }
    if (porte.present) {
      map['CAR_PORTE'] = Variable<String>(porte.value);
    }
    if (tipoCarga.present) {
      map['CAR_TIPO_CARGA'] = Variable<String>(tipoCarga.value);
    }
    if (chassis.present) {
      map['CAR_CHASSIS'] = Variable<String>(chassis.value);
    }
    if (modeloId.present) {
      map['FK_MODELOS_MOD_ID'] = Variable<int>(modeloId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CarrosTableCompanion(')
          ..write('id: $id, ')
          ..write('placa: $placa, ')
          ..write('cor: $cor, ')
          ..write('ano: $ano, ')
          ..write('porte: $porte, ')
          ..write('tipoCarga: $tipoCarga, ')
          ..write('chassis: $chassis, ')
          ..write('modeloId: $modeloId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $MarcasTableTable marcasTable = $MarcasTableTable(this);
  late final $ModelosTableTable modelosTable = $ModelosTableTable(this);
  late final $CarrosTableTable carrosTable = $CarrosTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    marcasTable,
    modelosTable,
    carrosTable,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'MARCAS',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('MODELOS', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'MODELOS',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('CARROS', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$MarcasTableTableCreateCompanionBuilder =
    MarcasTableCompanion Function({Value<int> id, required String nome});
typedef $$MarcasTableTableUpdateCompanionBuilder =
    MarcasTableCompanion Function({Value<int> id, Value<String> nome});

final class $$MarcasTableTableReferences
    extends BaseReferences<_$AppDatabase, $MarcasTableTable, MarcaEntity> {
  $$MarcasTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ModelosTableTable, List<ModeloEntity>>
  _modelosTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.modelosTable,
    aliasName: 'MARCAS__MAR_ID__MODELOS__FK_MARCAS_MAR_ID',
  );

  $$ModelosTableTableProcessedTableManager get modelosTableRefs {
    final manager = $$ModelosTableTableTableManager(
      $_db,
      $_db.modelosTable,
    ).filter((f) => f.marcaId.id.sqlEquals($_itemColumn<int>('MAR_ID')!));

    final cache = $_typedResult.readTableOrNull(_modelosTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$MarcasTableTableFilterComposer
    extends Composer<_$AppDatabase, $MarcasTableTable> {
  $$MarcasTableTableFilterComposer({
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

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> modelosTableRefs(
    Expression<bool> Function($$ModelosTableTableFilterComposer f) f,
  ) {
    final $$ModelosTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.modelosTable,
      getReferencedColumn: (t) => t.marcaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModelosTableTableFilterComposer(
            $db: $db,
            $table: $db.modelosTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MarcasTableTableOrderingComposer
    extends Composer<_$AppDatabase, $MarcasTableTable> {
  $$MarcasTableTableOrderingComposer({
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

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MarcasTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $MarcasTableTable> {
  $$MarcasTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  Expression<T> modelosTableRefs<T extends Object>(
    Expression<T> Function($$ModelosTableTableAnnotationComposer a) f,
  ) {
    final $$ModelosTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.modelosTable,
      getReferencedColumn: (t) => t.marcaId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModelosTableTableAnnotationComposer(
            $db: $db,
            $table: $db.modelosTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$MarcasTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MarcasTableTable,
          MarcaEntity,
          $$MarcasTableTableFilterComposer,
          $$MarcasTableTableOrderingComposer,
          $$MarcasTableTableAnnotationComposer,
          $$MarcasTableTableCreateCompanionBuilder,
          $$MarcasTableTableUpdateCompanionBuilder,
          (MarcaEntity, $$MarcasTableTableReferences),
          MarcaEntity,
          PrefetchHooks Function({bool modelosTableRefs})
        > {
  $$MarcasTableTableTableManager(_$AppDatabase db, $MarcasTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MarcasTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MarcasTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MarcasTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nome = const Value.absent(),
              }) => MarcasTableCompanion(id: id, nome: nome),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String nome}) =>
                  MarcasTableCompanion.insert(id: id, nome: nome),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MarcasTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({modelosTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (modelosTableRefs) db.modelosTable],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (modelosTableRefs)
                    await $_getPrefetchedData<
                      MarcaEntity,
                      $MarcasTableTable,
                      ModeloEntity
                    >(
                      currentTable: table,
                      referencedTable: $$MarcasTableTableReferences
                          ._modelosTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$MarcasTableTableReferences(
                            db,
                            table,
                            p0,
                          ).modelosTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.marcaId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$MarcasTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MarcasTableTable,
      MarcaEntity,
      $$MarcasTableTableFilterComposer,
      $$MarcasTableTableOrderingComposer,
      $$MarcasTableTableAnnotationComposer,
      $$MarcasTableTableCreateCompanionBuilder,
      $$MarcasTableTableUpdateCompanionBuilder,
      (MarcaEntity, $$MarcasTableTableReferences),
      MarcaEntity,
      PrefetchHooks Function({bool modelosTableRefs})
    >;
typedef $$ModelosTableTableCreateCompanionBuilder =
    ModelosTableCompanion Function({
      Value<int> id,
      required String nome,
      required int marcaId,
    });
typedef $$ModelosTableTableUpdateCompanionBuilder =
    ModelosTableCompanion Function({
      Value<int> id,
      Value<String> nome,
      Value<int> marcaId,
    });

final class $$ModelosTableTableReferences
    extends BaseReferences<_$AppDatabase, $ModelosTableTable, ModeloEntity> {
  $$ModelosTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $MarcasTableTable _marcaIdTable(_$AppDatabase db) =>
      db.marcasTable.createAlias('MODELOS__FK_MARCAS_MAR_ID__MARCAS__MAR_ID');

  $$MarcasTableTableProcessedTableManager get marcaId {
    final $_column = $_itemColumn<int>('FK_MARCAS_MAR_ID')!;

    final manager = $$MarcasTableTableTableManager(
      $_db,
      $_db.marcasTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_marcaIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CarrosTableTable, List<CarroEntity>>
  _carrosTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.carrosTable,
    aliasName: 'MODELOS__MOD_ID__CARROS__FK_MODELOS_MOD_ID',
  );

  $$CarrosTableTableProcessedTableManager get carrosTableRefs {
    final manager = $$CarrosTableTableTableManager(
      $_db,
      $_db.carrosTable,
    ).filter((f) => f.modeloId.id.sqlEquals($_itemColumn<int>('MOD_ID')!));

    final cache = $_typedResult.readTableOrNull(_carrosTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ModelosTableTableFilterComposer
    extends Composer<_$AppDatabase, $ModelosTableTable> {
  $$ModelosTableTableFilterComposer({
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

  ColumnFilters<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnFilters(column),
  );

  $$MarcasTableTableFilterComposer get marcaId {
    final $$MarcasTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.marcaId,
      referencedTable: $db.marcasTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MarcasTableTableFilterComposer(
            $db: $db,
            $table: $db.marcasTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> carrosTableRefs(
    Expression<bool> Function($$CarrosTableTableFilterComposer f) f,
  ) {
    final $$CarrosTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.carrosTable,
      getReferencedColumn: (t) => t.modeloId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CarrosTableTableFilterComposer(
            $db: $db,
            $table: $db.carrosTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ModelosTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ModelosTableTable> {
  $$ModelosTableTableOrderingComposer({
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

  ColumnOrderings<String> get nome => $composableBuilder(
    column: $table.nome,
    builder: (column) => ColumnOrderings(column),
  );

  $$MarcasTableTableOrderingComposer get marcaId {
    final $$MarcasTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.marcaId,
      referencedTable: $db.marcasTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MarcasTableTableOrderingComposer(
            $db: $db,
            $table: $db.marcasTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ModelosTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ModelosTableTable> {
  $$ModelosTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nome =>
      $composableBuilder(column: $table.nome, builder: (column) => column);

  $$MarcasTableTableAnnotationComposer get marcaId {
    final $$MarcasTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.marcaId,
      referencedTable: $db.marcasTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MarcasTableTableAnnotationComposer(
            $db: $db,
            $table: $db.marcasTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> carrosTableRefs<T extends Object>(
    Expression<T> Function($$CarrosTableTableAnnotationComposer a) f,
  ) {
    final $$CarrosTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.carrosTable,
      getReferencedColumn: (t) => t.modeloId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CarrosTableTableAnnotationComposer(
            $db: $db,
            $table: $db.carrosTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ModelosTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ModelosTableTable,
          ModeloEntity,
          $$ModelosTableTableFilterComposer,
          $$ModelosTableTableOrderingComposer,
          $$ModelosTableTableAnnotationComposer,
          $$ModelosTableTableCreateCompanionBuilder,
          $$ModelosTableTableUpdateCompanionBuilder,
          (ModeloEntity, $$ModelosTableTableReferences),
          ModeloEntity,
          PrefetchHooks Function({bool marcaId, bool carrosTableRefs})
        > {
  $$ModelosTableTableTableManager(_$AppDatabase db, $ModelosTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ModelosTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ModelosTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ModelosTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nome = const Value.absent(),
                Value<int> marcaId = const Value.absent(),
              }) => ModelosTableCompanion(id: id, nome: nome, marcaId: marcaId),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nome,
                required int marcaId,
              }) => ModelosTableCompanion.insert(
                id: id,
                nome: nome,
                marcaId: marcaId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ModelosTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({marcaId = false, carrosTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (carrosTableRefs) db.carrosTable],
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
                    if (marcaId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.marcaId,
                                referencedTable: $$ModelosTableTableReferences
                                    ._marcaIdTable(db),
                                referencedColumn: $$ModelosTableTableReferences
                                    ._marcaIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (carrosTableRefs)
                    await $_getPrefetchedData<
                      ModeloEntity,
                      $ModelosTableTable,
                      CarroEntity
                    >(
                      currentTable: table,
                      referencedTable: $$ModelosTableTableReferences
                          ._carrosTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ModelosTableTableReferences(
                            db,
                            table,
                            p0,
                          ).carrosTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.modeloId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ModelosTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ModelosTableTable,
      ModeloEntity,
      $$ModelosTableTableFilterComposer,
      $$ModelosTableTableOrderingComposer,
      $$ModelosTableTableAnnotationComposer,
      $$ModelosTableTableCreateCompanionBuilder,
      $$ModelosTableTableUpdateCompanionBuilder,
      (ModeloEntity, $$ModelosTableTableReferences),
      ModeloEntity,
      PrefetchHooks Function({bool marcaId, bool carrosTableRefs})
    >;
typedef $$CarrosTableTableCreateCompanionBuilder =
    CarrosTableCompanion Function({
      Value<int> id,
      required String placa,
      required String cor,
      required int ano,
      required String porte,
      required String tipoCarga,
      required String chassis,
      required int modeloId,
    });
typedef $$CarrosTableTableUpdateCompanionBuilder =
    CarrosTableCompanion Function({
      Value<int> id,
      Value<String> placa,
      Value<String> cor,
      Value<int> ano,
      Value<String> porte,
      Value<String> tipoCarga,
      Value<String> chassis,
      Value<int> modeloId,
    });

final class $$CarrosTableTableReferences
    extends BaseReferences<_$AppDatabase, $CarrosTableTable, CarroEntity> {
  $$CarrosTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ModelosTableTable _modeloIdTable(_$AppDatabase db) =>
      db.modelosTable.createAlias('CARROS__FK_MODELOS_MOD_ID__MODELOS__MOD_ID');

  $$ModelosTableTableProcessedTableManager get modeloId {
    final $_column = $_itemColumn<int>('FK_MODELOS_MOD_ID')!;

    final manager = $$ModelosTableTableTableManager(
      $_db,
      $_db.modelosTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_modeloIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CarrosTableTableFilterComposer
    extends Composer<_$AppDatabase, $CarrosTableTable> {
  $$CarrosTableTableFilterComposer({
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

  ColumnFilters<String> get placa => $composableBuilder(
    column: $table.placa,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cor => $composableBuilder(
    column: $table.cor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get ano => $composableBuilder(
    column: $table.ano,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get porte => $composableBuilder(
    column: $table.porte,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipoCarga => $composableBuilder(
    column: $table.tipoCarga,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get chassis => $composableBuilder(
    column: $table.chassis,
    builder: (column) => ColumnFilters(column),
  );

  $$ModelosTableTableFilterComposer get modeloId {
    final $$ModelosTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.modeloId,
      referencedTable: $db.modelosTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModelosTableTableFilterComposer(
            $db: $db,
            $table: $db.modelosTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CarrosTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CarrosTableTable> {
  $$CarrosTableTableOrderingComposer({
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

  ColumnOrderings<String> get placa => $composableBuilder(
    column: $table.placa,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cor => $composableBuilder(
    column: $table.cor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get ano => $composableBuilder(
    column: $table.ano,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get porte => $composableBuilder(
    column: $table.porte,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipoCarga => $composableBuilder(
    column: $table.tipoCarga,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get chassis => $composableBuilder(
    column: $table.chassis,
    builder: (column) => ColumnOrderings(column),
  );

  $$ModelosTableTableOrderingComposer get modeloId {
    final $$ModelosTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.modeloId,
      referencedTable: $db.modelosTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModelosTableTableOrderingComposer(
            $db: $db,
            $table: $db.modelosTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CarrosTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CarrosTableTable> {
  $$CarrosTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get placa =>
      $composableBuilder(column: $table.placa, builder: (column) => column);

  GeneratedColumn<String> get cor =>
      $composableBuilder(column: $table.cor, builder: (column) => column);

  GeneratedColumn<int> get ano =>
      $composableBuilder(column: $table.ano, builder: (column) => column);

  GeneratedColumn<String> get porte =>
      $composableBuilder(column: $table.porte, builder: (column) => column);

  GeneratedColumn<String> get tipoCarga =>
      $composableBuilder(column: $table.tipoCarga, builder: (column) => column);

  GeneratedColumn<String> get chassis =>
      $composableBuilder(column: $table.chassis, builder: (column) => column);

  $$ModelosTableTableAnnotationComposer get modeloId {
    final $$ModelosTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.modeloId,
      referencedTable: $db.modelosTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ModelosTableTableAnnotationComposer(
            $db: $db,
            $table: $db.modelosTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CarrosTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CarrosTableTable,
          CarroEntity,
          $$CarrosTableTableFilterComposer,
          $$CarrosTableTableOrderingComposer,
          $$CarrosTableTableAnnotationComposer,
          $$CarrosTableTableCreateCompanionBuilder,
          $$CarrosTableTableUpdateCompanionBuilder,
          (CarroEntity, $$CarrosTableTableReferences),
          CarroEntity,
          PrefetchHooks Function({bool modeloId})
        > {
  $$CarrosTableTableTableManager(_$AppDatabase db, $CarrosTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CarrosTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CarrosTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CarrosTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> placa = const Value.absent(),
                Value<String> cor = const Value.absent(),
                Value<int> ano = const Value.absent(),
                Value<String> porte = const Value.absent(),
                Value<String> tipoCarga = const Value.absent(),
                Value<String> chassis = const Value.absent(),
                Value<int> modeloId = const Value.absent(),
              }) => CarrosTableCompanion(
                id: id,
                placa: placa,
                cor: cor,
                ano: ano,
                porte: porte,
                tipoCarga: tipoCarga,
                chassis: chassis,
                modeloId: modeloId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String placa,
                required String cor,
                required int ano,
                required String porte,
                required String tipoCarga,
                required String chassis,
                required int modeloId,
              }) => CarrosTableCompanion.insert(
                id: id,
                placa: placa,
                cor: cor,
                ano: ano,
                porte: porte,
                tipoCarga: tipoCarga,
                chassis: chassis,
                modeloId: modeloId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CarrosTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({modeloId = false}) {
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
                    if (modeloId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.modeloId,
                                referencedTable: $$CarrosTableTableReferences
                                    ._modeloIdTable(db),
                                referencedColumn: $$CarrosTableTableReferences
                                    ._modeloIdTable(db)
                                    .id,
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

typedef $$CarrosTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CarrosTableTable,
      CarroEntity,
      $$CarrosTableTableFilterComposer,
      $$CarrosTableTableOrderingComposer,
      $$CarrosTableTableAnnotationComposer,
      $$CarrosTableTableCreateCompanionBuilder,
      $$CarrosTableTableUpdateCompanionBuilder,
      (CarroEntity, $$CarrosTableTableReferences),
      CarroEntity,
      PrefetchHooks Function({bool modeloId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$MarcasTableTableTableManager get marcasTable =>
      $$MarcasTableTableTableManager(_db, _db.marcasTable);
  $$ModelosTableTableTableManager get modelosTable =>
      $$ModelosTableTableTableManager(_db, _db.modelosTable);
  $$CarrosTableTableTableManager get carrosTable =>
      $$CarrosTableTableTableManager(_db, _db.carrosTable);
}
