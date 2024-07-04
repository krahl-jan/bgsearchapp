// option types:

// field contains string
// filed comparison with int/float
// boolean
// select string(s) from choice

import 'package:bgsearchapp/2_application/filters/library/categories.dart';
import 'library/dropdown_element.dart';
import 'library/filter_types.dart';
import 'library/filter_int_ranges.dart';

abstract class Filter {
  final FilterEnum filterType;

  bool hasValue();

  getValue();
  getValue2();

  Filter(
      {required this.filterType, required FilterType optionFieldType}) {
    if (filterType.filterType != optionFieldType) {
      throw const FormatException("option field types dont match");
    }
  }
}

Filter optionFactory(
    {required FilterEnum filterEnum, String? value, String? value2}) {
  return switch (filterEnum.filterType) {
    FilterType.string =>
      FilterString(filterType: filterEnum, value: value),
    FilterType.int => FilterInt(
        filterEnum,
        intRangeMap[filterEnum] ?? OptionIntRange.fallback,
        int.parse(value ?? intRangeMap[filterEnum]!.low.toString()),
        int.parse(value2 ?? intRangeMap[filterEnum]!.high.toString())),
    FilterType.dropdown => OptionDropdownList<CategoriesList>(
        filterType: filterEnum,
        value: value != null
            ? CategoriesList.values.byName(value)
            : CategoriesList.values.first),
    FilterType.boolean => throw UnimplementedError(),

  };
}

class FilterString extends Filter {
  String? value;

  FilterString({required super.filterType, this.value})
      : super(optionFieldType: FilterType.string);

  FilterString factory(FilterEnum filterType) {
    return FilterString(filterType: filterType);
  }

  @override
  bool hasValue() {
    return value != null;
  }

  @override
  getValue() {
    return value;
  }

  @override
  getValue2() {
    return "";
  }

}

class FilterInt extends Filter {
  OptionIntRange range;
  int lowValue;
  int highValue;

  factory FilterInt(FilterEnum optionField, OptionIntRange optionIntRange, int? low, int? high) {
    int lowValue = low ?? optionIntRange.low.round();
    int highValue = high ?? optionIntRange.high.round();
    if (lowValue < optionIntRange.low.round()) {
      lowValue = optionIntRange.low.round();
    }
    if (highValue > optionIntRange.high.round()) {
      highValue = optionIntRange.high.round();
    }

    return  FilterInt._(filterType: optionField, range: optionIntRange, lowValue:  lowValue, highValue:  highValue);
  }


  FilterInt._(
      {required super.filterType,
      required this.range,
      required this.lowValue,
      required this.highValue})
      : super(optionFieldType: FilterType.int);

  @override
  bool hasValue() {
    return true;
  }


  @override
  getValue() {
    return lowValue;
  }

  @override
  getValue2() {
    if (highValue == range.high) {
      // maximum of range means any value
      return 10000;
    }
    return highValue;
  }
}

abstract class OptionBoolean implements Filter {}

class OptionDropdownList<T extends Enum> extends Filter {
  DropdownListElement value;
  FilterType type = FilterType.dropdown;

  OptionDropdownList({required super.filterType, required this.value})
      : super(optionFieldType: FilterType.dropdown);

  @override
  bool hasValue() {
    return true;
  }


  @override
  getValue() {
    return value.getName();
  }

  @override
  getValue2() {
    return "";
  }
}
