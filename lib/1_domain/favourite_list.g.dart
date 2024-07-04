// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_list.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFavouriteListDBCollection on Isar {
  IsarCollection<FavouriteListDB> get favouriteListDBs => this.collection();
}

const FavouriteListDBSchema = CollectionSchema(
  name: r'FavouriteListDB',
  id: 1269180318640984669,
  properties: {
    r'favouriteList': PropertySchema(
      id: 0,
      name: r'favouriteList',
      type: IsarType.objectList,
      target: r'GameShortInfo',
    )
  },
  estimateSize: _favouriteListDBEstimateSize,
  serialize: _favouriteListDBSerialize,
  deserialize: _favouriteListDBDeserialize,
  deserializeProp: _favouriteListDBDeserializeProp,
  idName: r'dbId',
  indexes: {},
  links: {},
  embeddedSchemas: {r'GameShortInfo': GameShortInfoSchema},
  getId: _favouriteListDBGetId,
  getLinks: _favouriteListDBGetLinks,
  attach: _favouriteListDBAttach,
  version: '3.1.0+1',
);

int _favouriteListDBEstimateSize(
  FavouriteListDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.favouriteList.length * 3;
  {
    final offsets = allOffsets[GameShortInfo]!;
    for (var i = 0; i < object.favouriteList.length; i++) {
      final value = object.favouriteList[i];
      bytesCount +=
          GameShortInfoSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _favouriteListDBSerialize(
  FavouriteListDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<GameShortInfo>(
    offsets[0],
    allOffsets,
    GameShortInfoSchema.serialize,
    object.favouriteList,
  );
}

FavouriteListDB _favouriteListDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FavouriteListDB(
    reader.readObjectList<GameShortInfo>(
          offsets[0],
          GameShortInfoSchema.deserialize,
          allOffsets,
          GameShortInfo(),
        ) ??
        [],
  );
  object.dbId = id;
  return object;
}

P _favouriteListDBDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<GameShortInfo>(
            offset,
            GameShortInfoSchema.deserialize,
            allOffsets,
            GameShortInfo(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _favouriteListDBGetId(FavouriteListDB object) {
  return object.dbId;
}

List<IsarLinkBase<dynamic>> _favouriteListDBGetLinks(FavouriteListDB object) {
  return [];
}

void _favouriteListDBAttach(
    IsarCollection<dynamic> col, Id id, FavouriteListDB object) {
  object.dbId = id;
}

extension FavouriteListDBQueryWhereSort
    on QueryBuilder<FavouriteListDB, FavouriteListDB, QWhere> {
  QueryBuilder<FavouriteListDB, FavouriteListDB, QAfterWhere> anyDbId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FavouriteListDBQueryWhere
    on QueryBuilder<FavouriteListDB, FavouriteListDB, QWhereClause> {
  QueryBuilder<FavouriteListDB, FavouriteListDB, QAfterWhereClause> dbIdEqualTo(
      Id dbId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: dbId,
        upper: dbId,
      ));
    });
  }

  QueryBuilder<FavouriteListDB, FavouriteListDB, QAfterWhereClause>
      dbIdNotEqualTo(Id dbId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: dbId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: dbId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: dbId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: dbId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<FavouriteListDB, FavouriteListDB, QAfterWhereClause>
      dbIdGreaterThan(Id dbId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: dbId, includeLower: include),
      );
    });
  }

  QueryBuilder<FavouriteListDB, FavouriteListDB, QAfterWhereClause>
      dbIdLessThan(Id dbId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: dbId, includeUpper: include),
      );
    });
  }

  QueryBuilder<FavouriteListDB, FavouriteListDB, QAfterWhereClause> dbIdBetween(
    Id lowerDbId,
    Id upperDbId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerDbId,
        includeLower: includeLower,
        upper: upperDbId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FavouriteListDBQueryFilter
    on QueryBuilder<FavouriteListDB, FavouriteListDB, QFilterCondition> {
  QueryBuilder<FavouriteListDB, FavouriteListDB, QAfterFilterCondition>
      dbIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dbId',
        value: value,
      ));
    });
  }

  QueryBuilder<FavouriteListDB, FavouriteListDB, QAfterFilterCondition>
      dbIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dbId',
        value: value,
      ));
    });
  }

  QueryBuilder<FavouriteListDB, FavouriteListDB, QAfterFilterCondition>
      dbIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dbId',
        value: value,
      ));
    });
  }

  QueryBuilder<FavouriteListDB, FavouriteListDB, QAfterFilterCondition>
      dbIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dbId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FavouriteListDB, FavouriteListDB, QAfterFilterCondition>
      favouriteListLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'favouriteList',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FavouriteListDB, FavouriteListDB, QAfterFilterCondition>
      favouriteListIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'favouriteList',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FavouriteListDB, FavouriteListDB, QAfterFilterCondition>
      favouriteListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'favouriteList',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FavouriteListDB, FavouriteListDB, QAfterFilterCondition>
      favouriteListLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'favouriteList',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FavouriteListDB, FavouriteListDB, QAfterFilterCondition>
      favouriteListLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'favouriteList',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FavouriteListDB, FavouriteListDB, QAfterFilterCondition>
      favouriteListLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'favouriteList',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension FavouriteListDBQueryObject
    on QueryBuilder<FavouriteListDB, FavouriteListDB, QFilterCondition> {
  QueryBuilder<FavouriteListDB, FavouriteListDB, QAfterFilterCondition>
      favouriteListElement(FilterQuery<GameShortInfo> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'favouriteList');
    });
  }
}

extension FavouriteListDBQueryLinks
    on QueryBuilder<FavouriteListDB, FavouriteListDB, QFilterCondition> {}

extension FavouriteListDBQuerySortBy
    on QueryBuilder<FavouriteListDB, FavouriteListDB, QSortBy> {}

extension FavouriteListDBQuerySortThenBy
    on QueryBuilder<FavouriteListDB, FavouriteListDB, QSortThenBy> {
  QueryBuilder<FavouriteListDB, FavouriteListDB, QAfterSortBy> thenByDbId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbId', Sort.asc);
    });
  }

  QueryBuilder<FavouriteListDB, FavouriteListDB, QAfterSortBy>
      thenByDbIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbId', Sort.desc);
    });
  }
}

extension FavouriteListDBQueryWhereDistinct
    on QueryBuilder<FavouriteListDB, FavouriteListDB, QDistinct> {}

extension FavouriteListDBQueryProperty
    on QueryBuilder<FavouriteListDB, FavouriteListDB, QQueryProperty> {
  QueryBuilder<FavouriteListDB, int, QQueryOperations> dbIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dbId');
    });
  }

  QueryBuilder<FavouriteListDB, List<GameShortInfo>, QQueryOperations>
      favouriteListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'favouriteList');
    });
  }
}
