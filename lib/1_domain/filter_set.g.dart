// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_set.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFilterSetCollection on Isar {
  IsarCollection<FilterSet> get filterSets => this.collection();
}

const FilterSetSchema = CollectionSchema(
  name: r'FilterSet',
  id: 4496610921514377517,
  properties: {
    r'filterList': PropertySchema(
      id: 0,
      name: r'filterList',
      type: IsarType.objectList,
      target: r'FilterDB',
    ),
    r'name': PropertySchema(
      id: 1,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _filterSetEstimateSize,
  serialize: _filterSetSerialize,
  deserialize: _filterSetDeserialize,
  deserializeProp: _filterSetDeserializeProp,
  idName: r'dbId',
  indexes: {},
  links: {},
  embeddedSchemas: {r'FilterDB': FilterDBSchema},
  getId: _filterSetGetId,
  getLinks: _filterSetGetLinks,
  attach: _filterSetAttach,
  version: '3.1.0+1',
);

int _filterSetEstimateSize(
  FilterSet object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.filterList.length * 3;
  {
    final offsets = allOffsets[FilterDB]!;
    for (var i = 0; i < object.filterList.length; i++) {
      final value = object.filterList[i];
      bytesCount += FilterDBSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _filterSetSerialize(
  FilterSet object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<FilterDB>(
    offsets[0],
    allOffsets,
    FilterDBSchema.serialize,
    object.filterList,
  );
  writer.writeString(offsets[1], object.name);
}

FilterSet _filterSetDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FilterSet(
    reader.readString(offsets[1]),
    reader.readObjectList<FilterDB>(
          offsets[0],
          FilterDBSchema.deserialize,
          allOffsets,
          FilterDB(),
        ) ??
        [],
  );
  object.dbId = id;
  return object;
}

P _filterSetDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<FilterDB>(
            offset,
            FilterDBSchema.deserialize,
            allOffsets,
            FilterDB(),
          ) ??
          []) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _filterSetGetId(FilterSet object) {
  return object.dbId;
}

List<IsarLinkBase<dynamic>> _filterSetGetLinks(FilterSet object) {
  return [];
}

void _filterSetAttach(IsarCollection<dynamic> col, Id id, FilterSet object) {
  object.dbId = id;
}

extension FilterSetQueryWhereSort
    on QueryBuilder<FilterSet, FilterSet, QWhere> {
  QueryBuilder<FilterSet, FilterSet, QAfterWhere> anyDbId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FilterSetQueryWhere
    on QueryBuilder<FilterSet, FilterSet, QWhereClause> {
  QueryBuilder<FilterSet, FilterSet, QAfterWhereClause> dbIdEqualTo(Id dbId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: dbId,
        upper: dbId,
      ));
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterWhereClause> dbIdNotEqualTo(
      Id dbId) {
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

  QueryBuilder<FilterSet, FilterSet, QAfterWhereClause> dbIdGreaterThan(Id dbId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: dbId, includeLower: include),
      );
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterWhereClause> dbIdLessThan(Id dbId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: dbId, includeUpper: include),
      );
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterWhereClause> dbIdBetween(
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

extension FilterSetQueryFilter
    on QueryBuilder<FilterSet, FilterSet, QFilterCondition> {
  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition> dbIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dbId',
        value: value,
      ));
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition> dbIdGreaterThan(
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

  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition> dbIdLessThan(
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

  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition> dbIdBetween(
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

  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition>
      filterListLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'filterList',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition>
      filterListIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'filterList',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition>
      filterListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'filterList',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition>
      filterListLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'filterList',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition>
      filterListLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'filterList',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition>
      filterListLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'filterList',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension FilterSetQueryObject
    on QueryBuilder<FilterSet, FilterSet, QFilterCondition> {
  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition> filterListElement(
      FilterQuery<FilterDB> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'filterList');
    });
  }
}

extension FilterSetQueryLinks
    on QueryBuilder<FilterSet, FilterSet, QFilterCondition> {}

extension FilterSetQuerySortBy on QueryBuilder<FilterSet, FilterSet, QSortBy> {
  QueryBuilder<FilterSet, FilterSet, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension FilterSetQuerySortThenBy
    on QueryBuilder<FilterSet, FilterSet, QSortThenBy> {
  QueryBuilder<FilterSet, FilterSet, QAfterSortBy> thenByDbId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbId', Sort.asc);
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterSortBy> thenByDbIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dbId', Sort.desc);
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<FilterSet, FilterSet, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension FilterSetQueryWhereDistinct
    on QueryBuilder<FilterSet, FilterSet, QDistinct> {
  QueryBuilder<FilterSet, FilterSet, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension FilterSetQueryProperty
    on QueryBuilder<FilterSet, FilterSet, QQueryProperty> {
  QueryBuilder<FilterSet, int, QQueryOperations> dbIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dbId');
    });
  }

  QueryBuilder<FilterSet, List<FilterDB>, QQueryOperations>
      filterListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'filterList');
    });
  }

  QueryBuilder<FilterSet, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FilterDBSchema = Schema(
  name: r'FilterDB',
  id: 5576215066464661988,
  properties: {
    r'filter': PropertySchema(
      id: 0,
      name: r'filter',
      type: IsarType.byte,
      enumMap: _FilterDBfilterEnumValueMap,
    ),
    r'value': PropertySchema(
      id: 1,
      name: r'value',
      type: IsarType.string,
    ),
    r'value2': PropertySchema(
      id: 2,
      name: r'value2',
      type: IsarType.string,
    )
  },
  estimateSize: _filterDBEstimateSize,
  serialize: _filterDBSerialize,
  deserialize: _filterDBDeserialize,
  deserializeProp: _filterDBDeserializeProp,
);

int _filterDBEstimateSize(
  FilterDB object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.value;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.value2;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _filterDBSerialize(
  FilterDB object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.filter.index);
  writer.writeString(offsets[1], object.value);
  writer.writeString(offsets[2], object.value2);
}

FilterDB _filterDBDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FilterDB(
    filter: _FilterDBfilterValueEnumMap[reader.readByteOrNull(offsets[0])] ??
        FilterEnum.nameContains,
    value: reader.readStringOrNull(offsets[1]),
    value2: reader.readStringOrNull(offsets[2]),
  );
  return object;
}

P _filterDBDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_FilterDBfilterValueEnumMap[reader.readByteOrNull(offset)] ??
          FilterEnum.nameContains) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _FilterDBfilterEnumValueMap = {
  'nameContains': 0,
  'descriptionContains': 1,
  'age': 2,
  'maxPlaytime': 3,
  'category': 4,
  'maxPlayers': 5,
  'bestPlayers': 6,
  'bestOrGoodPlayerCount': 7,
  'releaseYear': 8,
};
const _FilterDBfilterValueEnumMap = {
  0: FilterEnum.nameContains,
  1: FilterEnum.descriptionContains,
  2: FilterEnum.age,
  3: FilterEnum.maxPlaytime,
  4: FilterEnum.category,
  5: FilterEnum.maxPlayers,
  6: FilterEnum.bestPlayers,
  7: FilterEnum.bestOrGoodPlayerCount,
  8: FilterEnum.releaseYear,
};

extension FilterDBQueryFilter
    on QueryBuilder<FilterDB, FilterDB, QFilterCondition> {
  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> filterEqualTo(
      FilterEnum value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'filter',
        value: value,
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> filterGreaterThan(
    FilterEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'filter',
        value: value,
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> filterLessThan(
    FilterEnum value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'filter',
        value: value,
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> filterBetween(
    FilterEnum lower,
    FilterEnum upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'filter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> valueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> valueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> valueEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> valueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> valueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> valueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> valueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> valueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> valueContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> valueMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'value',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> valueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: '',
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> valueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'value',
        value: '',
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> value2IsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'value2',
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> value2IsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'value2',
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> value2EqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> value2GreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> value2LessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> value2Between(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value2',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> value2StartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'value2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> value2EndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'value2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> value2Contains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'value2',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> value2Matches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'value2',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> value2IsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value2',
        value: '',
      ));
    });
  }

  QueryBuilder<FilterDB, FilterDB, QAfterFilterCondition> value2IsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'value2',
        value: '',
      ));
    });
  }
}

extension FilterDBQueryObject
    on QueryBuilder<FilterDB, FilterDB, QFilterCondition> {}
