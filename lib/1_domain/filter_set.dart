import 'package:isar/isar.dart';

import '../2_application/options/library/option_fields.dart';
import '../2_application/options/options.dart';

part 'filter_set.g.dart';

@collection
class FilterSet {
  Id dbId = Isar.autoIncrement;
  String name;
  List<Filter> filterList = List.empty();

  FilterSet(this.name, this.filterList);
}

FilterSet toDbFilterSet(String name, List<Option> options) {
  List<Filter> f = List.empty(growable: true);
  for (Option o in options) {
    dynamic value = o.getValue();
    dynamic value2 = o.getValue2();
    f.add(Filter(
        optionField: o.optionField,
        value: value?.toString(),
        value2: value2.toString()));
  }
  return FilterSet(name, f);
}

List<Option> toOptionList(FilterSet filterSet) {
  List<Option> l = List.empty(growable: true);
  for (Filter f in filterSet.filterList) {
    l.add(optionFactory(
        optionField: f.optionField, value: f.value, value2: f.value2));
  }
  return l;
}

@embedded
class Filter {

  String? value;
  String? value2;
  @enumerated
  late OptionField optionField;

  Filter(
      {this.optionField = OptionField.nameContains, this.value, this.value2});
}
