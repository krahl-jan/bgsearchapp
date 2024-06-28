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
  properties: {},
  estimateSize: _filterSetEstimateSize,
  serialize: _filterSetSerialize,
  deserialize: _filterSetDeserialize,
  deserializeProp: _filterSetDeserializeProp,
  idName: r'dbId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
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
  return bytesCount;
}

void _filterSetSerialize(
  FilterSet object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {}
FilterSet _filterSetDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FilterSet();
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
}

extension FilterSetQueryObject
    on QueryBuilder<FilterSet, FilterSet, QFilterCondition> {}

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
}
