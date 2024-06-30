import 'package:isar/isar.dart';

import '../2_application/operators.dart';
import '../2_application/options/library/option_fields.dart';
import '../2_application/options/options.dart';

part 'filter_set.g.dart';

@collection
class FilterSet {
  Id dbId = Isar.autoIncrement;
  List<Filter> filterList = List.empty();

  FilterSet(this.filterList);
  
}

FilterSet toDbFilterSet(List<Option> options)  {
  List<Filter> f = List.empty(growable: true);
  for (Option o in options) {
    dynamic value = o.getValue();
    dynamic operator = o.getOperator();
    f.add(Filter(optionField: o.optionField, value: value?.toString(), operator: operator.toString()));
  }
  return FilterSet(f);
}

List<Option> toOptionList(FilterSet filterSet) {
  List<Option> l = List.empty(growable: true);
  for (Filter f in filterSet.filterList) {
    Operator? operator = f.operator != null ? Operator.values.byName(f.operator!) : null;
    l.add(optionFactory(optionField: f.optionField, operator: operator, value: f.value));
  }
  return l;
}

@embedded
class Filter {
  String? value;
  @enumerated
  String? operator;
  @enumerated
  late OptionField optionField;

  Filter({this.optionField = OptionField.nameContains, this.value, this.operator});
}
