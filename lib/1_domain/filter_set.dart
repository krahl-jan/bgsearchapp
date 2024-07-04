import 'package:isar/isar.dart';

import '../2_application/filters/library/filter_types.dart';
import '../2_application/filters/filters.dart';

part 'filter_set.g.dart';

@collection
class FilterSet {
  Id dbId = Isar.autoIncrement;
  String name;
  List<FilterDB> filterList = List.empty();

  FilterSet(this.name, this.filterList);
}

FilterSet toDbFilterSet(String name, List<Filter> options) {
  List<FilterDB> f = List.empty(growable: true);
  for (Filter o in options) {
    dynamic value = o.getValue();
    dynamic value2 = o.getValue2();
    f.add(FilterDB(
        filter: o.filterType,
        value: value?.toString(),
        value2: value2.toString()));
  }
  return FilterSet(name, f);
}

List<Filter> toOptionList(FilterSet filterSet) {
  List<Filter> l = List.empty(growable: true);
  for (FilterDB f in filterSet.filterList) {
    l.add(optionFactory(
        filterEnum: f.filter, value: f.value, value2: f.value2));
  }
  return l;
}

@embedded
class FilterDB {

  String? value;
  String? value2;
  @enumerated
  late FilterEnum filter;

  FilterDB(
      {this.filter = FilterEnum.nameContains, this.value, this.value2});
}
