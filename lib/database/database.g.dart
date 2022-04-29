// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Livestock extends DataClass implements Insertable<Livestock> {
  final int id;
  final String name;
  final String image;
  final String breed;
  final DateTime dob;
  Livestock(
      {required this.id,
      required this.name,
      required this.image,
      required this.breed,
      required this.dob});
  factory Livestock.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Livestock(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      image: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}image'])!,
      breed: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}breed'])!,
      dob: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}dob'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['image'] = Variable<String>(image);
    map['breed'] = Variable<String>(breed);
    map['dob'] = Variable<DateTime>(dob);
    return map;
  }

  LivestocksCompanion toCompanion(bool nullToAbsent) {
    return LivestocksCompanion(
      id: Value(id),
      name: Value(name),
      image: Value(image),
      breed: Value(breed),
      dob: Value(dob),
    );
  }

  factory Livestock.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Livestock(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String>(json['image']),
      breed: serializer.fromJson<String>(json['breed']),
      dob: serializer.fromJson<DateTime>(json['dob']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String>(image),
      'breed': serializer.toJson<String>(breed),
      'dob': serializer.toJson<DateTime>(dob),
    };
  }

  Livestock copyWith(
          {int? id,
          String? name,
          String? image,
          String? breed,
          DateTime? dob}) =>
      Livestock(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        breed: breed ?? this.breed,
        dob: dob ?? this.dob,
      );
  @override
  String toString() {
    return (StringBuffer('Livestock(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('breed: $breed, ')
          ..write('dob: $dob')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, image, breed, dob);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Livestock &&
          other.id == this.id &&
          other.name == this.name &&
          other.image == this.image &&
          other.breed == this.breed &&
          other.dob == this.dob);
}

class LivestocksCompanion extends UpdateCompanion<Livestock> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> image;
  final Value<String> breed;
  final Value<DateTime> dob;
  const LivestocksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.breed = const Value.absent(),
    this.dob = const Value.absent(),
  });
  LivestocksCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String image,
    required String breed,
    required DateTime dob,
  })  : name = Value(name),
        image = Value(image),
        breed = Value(breed),
        dob = Value(dob);
  static Insertable<Livestock> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? image,
    Expression<String>? breed,
    Expression<DateTime>? dob,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (breed != null) 'breed': breed,
      if (dob != null) 'dob': dob,
    });
  }

  LivestocksCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? image,
      Value<String>? breed,
      Value<DateTime>? dob}) {
    return LivestocksCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      breed: breed ?? this.breed,
      dob: dob ?? this.dob,
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
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (breed.present) {
      map['breed'] = Variable<String>(breed.value);
    }
    if (dob.present) {
      map['dob'] = Variable<DateTime>(dob.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LivestocksCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('breed: $breed, ')
          ..write('dob: $dob')
          ..write(')'))
        .toString();
  }
}

class $LivestocksTable extends Livestocks
    with TableInfo<$LivestocksTable, Livestock> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LivestocksTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String?> image = GeneratedColumn<String?>(
      'image', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _breedMeta = const VerificationMeta('breed');
  @override
  late final GeneratedColumn<String?> breed = GeneratedColumn<String?>(
      'breed', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _dobMeta = const VerificationMeta('dob');
  @override
  late final GeneratedColumn<DateTime?> dob = GeneratedColumn<DateTime?>(
      'dob', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, image, breed, dob];
  @override
  String get aliasedName => _alias ?? 'livestocks';
  @override
  String get actualTableName => 'livestocks';
  @override
  VerificationContext validateIntegrity(Insertable<Livestock> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('breed')) {
      context.handle(
          _breedMeta, breed.isAcceptableOrUnknown(data['breed']!, _breedMeta));
    } else if (isInserting) {
      context.missing(_breedMeta);
    }
    if (data.containsKey('dob')) {
      context.handle(
          _dobMeta, dob.isAcceptableOrUnknown(data['dob']!, _dobMeta));
    } else if (isInserting) {
      context.missing(_dobMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Livestock map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Livestock.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LivestocksTable createAlias(String alias) {
    return $LivestocksTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $LivestocksTable livestocks = $LivestocksTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [livestocks];
}
