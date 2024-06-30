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
      target: r'Filter',
    )
  },
  estimateSize: _filterSetEstimateSize,
  serialize: _filterSetSerialize,
  deserialize: _filterSetDeserialize,
  deserializeProp: _filterSetDeserializeProp,
  idName: r'dbId',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Filter': FilterSchema},
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
    final offsets = allOffsets[Filter]!;
    for (var i = 0; i < object.filterList.length; i++) {
      final value = object.filterList[i];
      bytesCount += FilterSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _filterSetSerialize(
  FilterSet object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Filter>(
    offsets[0],
    allOffsets,
    FilterSchema.serialize,
    object.filterList,
  );
}

FilterSet _filterSetDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FilterSet();
  object.dbId = id;
  object.filterList = reader.readObjectList<Filter>(
        offsets[0],
        FilterSchema.deserialize,
        allOffsets,
        Filter(),
      ) ??
      [];
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
      return (reader.readObjectList<Filter>(
            offset,
            FilterSchema.deserialize,
            allOffsets,
            Filter(),
          ) ??
          []) as P;
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
}

extension FilterSetQueryObject
    on QueryBuilder<FilterSet, FilterSet, QFilterCondition> {
  QueryBuilder<FilterSet, FilterSet, QAfterFilterCondition> filterListElement(
      FilterQuery<Filter> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'filterList');
    });
  }
}

extension FilterSetQueryLinks
    on QueryBuilder<FilterSet, FilterSet, QFilterCondition> {}

extension FilterSetQuerySortBy on QueryBuilder<FilterSet, FilterSet, QSortBy> {}

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
}

extension FilterSetQueryWhereDistinct
    on QueryBuilder<FilterSet, FilterSet, QDistinct> {}

extension FilterSetQueryProperty
    on QueryBuilder<FilterSet, FilterSet, QQueryProperty> {
  QueryBuilder<FilterSet, int, QQueryOperations> dbIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dbId');
    });
  }

  QueryBuilder<FilterSet, List<Filter>, QQueryOperations> filterListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'filterList');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const FilterSchema = Schema(
  name: r'Filter',
  id: 4479994633252671336,
  properties: {
    r'operator': PropertySchema(
      id: 0,
      name: r'operator',
      type: IsarType.string,
    ),
    r'optionField': PropertySchema(
      id: 1,
      name: r'optionField',
      type: IsarType.byte,
      enumMap: _FilteroptionFieldEnumValueMap,
    ),
    r'value': PropertySchema(
      id: 2,
      name: r'value',
      type: IsarType.string,
    )
  },
  estimateSize: _filterEstimateSize,
  serialize: _filterSerialize,
  deserialize: _filterDeserialize,
  deserializeProp: _filterDeserializeProp,
);

int _filterEstimateSize(
  Filter object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.operator;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.value;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _filterSerialize(
  Filter object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.operator);
  writer.writeByte(offsets[1], object.optionField.index);
  writer.writeString(offsets[2], object.value);
}

Filter _filterDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Filter();
  object.operator = reader.readStringOrNull(offsets[0]);
  object.optionField =
      _FilteroptionFieldValueEnumMap[reader.readByteOrNull(offsets[1])] ??
          OptionField.nameContains;
  object.value = reader.readStringOrNull(offsets[2]);
  return object;
}

P _filterDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (_FilteroptionFieldValueEnumMap[reader.readByteOrNull(offset)] ??
          OptionField.nameContains) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _FilteroptionFieldEnumValueMap = {
  'nameContains': 0,
  'descriptionContains': 1,
  'age': 2,
  'maxPlaytime': 3,
  'category': 4,
  'maxPlayers': 5,
  'bestPlayers': 6,
  'bestOrGoodPlayerCount': 7,
};
const _FilteroptionFieldValueEnumMap = {
  0: OptionField.nameContains,
  1: OptionField.descriptionContains,
  2: OptionField.age,
  3: OptionField.maxPlaytime,
  4: OptionField.category,
  5: OptionField.maxPlayers,
  6: OptionField.bestPlayers,
  7: OptionField.bestOrGoodPlayerCount,
};

extension FilterQueryFilter on QueryBuilder<Filter, Filter, QFilterCondition> {
  QueryBuilder<Filter, Filter, QAfterFilterCondition> operatorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'operator',
      ));
    });
  }

  QueryBuilder<Filter, Filter, QAfterFilterCondition> operatorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'operator',
      ));
    });
  }

  QueryBuilder<Filter, Filter, QAfterFilterCondition> operatorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'operator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Filter, Filter, QAfterFilterCondition> operatorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'operator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Filter, Filter, QAfterFilterCondition> operatorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'operator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Filter, Filter, QAfterFilterCondition> operatorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'operator',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Filter, Filter, QAfterFilterCondition> operatorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'operator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Filter, Filter, QAfterFilterCondition> operatorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'operator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Filter, Filter, QAfterFilterCondition> operatorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'operator',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Filter, Filter, QAfterFilterCondition> operatorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'operator',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Filter, Filter, QAfterFilterCondition> operatorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'operator',
        value: '',
      ));
    });
  }

  QueryBuilder<Filter, Filter, QAfterFilterCondition> operatorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'operator',
        value: '',
      ));
    });
  }

  QueryBuilder<Filter, Filter, QAfterFilterCondition> optionFieldEqualTo(
      OptionField value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'optionField',
        value: value,
      ));
    });
  }

  QueryBuilder<Filter, Filter, QAfterFilterCondition> optionFieldGreaterThan(
    OptionField value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'optionField',
        value: value,
      ));
    });
  }

  QueryBuilder<Filter, Filter, QAfterFilterCondition> optionFieldLessThan(
    OptionField value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'optionField',
        value: value,
      ));
    });
  }

  QueryBuilder<Filter, Filter, QAfterFilterCondition> optionFieldBetween(
    OptionField lower,
    OptionField upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'optionField',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Filter, Filter, QAfterFilterCondition> valueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<Filter, Filter, QAfterFilterCondition> valueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<Filter, Filter, QAfterFilterCondition> valueEqualTo(
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

  QueryBuilder<Filter, Filter, QAfterFilterCondition> valueGreaterThan(
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

  QueryBuilder<Filter, Filter, QAfterFilterCondition> valueLessThan(
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

  QueryBuilder<Filter, Filter, QAfterFilterCondition> valueBetween(
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

  QueryBuilder<Filter, Filter, QAfterFilterCondition> valueStartsWith(
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

  QueryBuilder<Filter, Filter, QAfterFilterCondition> valueEndsWith(
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

  QueryBuilder<Filter, Filter, QAfterFilterCondition> valueContains(
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

  QueryBuilder<Filter, Filter, QAfterFilterCondition> valueMatches(
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

  QueryBuilder<Filter, Filter, QAfterFilterCondition> valueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: '',
      ));
    });
  }

  QueryBuilder<Filter, Filter, QAfterFilterCondition> valueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'value',
        value: '',
      ));
    });
  }
}

extension FilterQueryObject on QueryBuilder<Filter, Filter, QFilterCondition> {}
