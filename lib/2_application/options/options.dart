// option types:

// field contains string
// filed comparison with int/float
// boolean
// select string(s) from choice

import 'package:bgsearchapp/2_application/options/library/categories.dart';

import '../operators.dart';
import 'library/dropdown_option.dart';
import 'library/option_fields.dart';
import 'library/option_int_ranges.dart';

abstract class Option {
  final OptionField optionField;

  bool hasValue();

  getValue();
  getValue2();

  Option(
      {required this.optionField, required OptionFieldType optionFieldType}) {
    if (optionField.optionFieldType != optionFieldType)
      throw const FormatException("option field types dont match");
  }
}

Option optionFactory(
    {required OptionField optionField, String? value, String? value2}) {
  return switch (optionField.optionFieldType) {
    OptionFieldType.string =>
      OptionString(optionField: optionField, value: value),
    OptionFieldType.int => OptionInt(
        optionField,
        intRangeMap[optionField] ?? OptionIntRange.fallback,
        int.parse(value ?? intRangeMap[optionField]!.low.toString()),
        int.parse(value2 ?? intRangeMap[optionField]!.high.toString())),
    OptionFieldType.dropdown => OptionDropdownList<CategoriesList>(
        optionField: optionField,
        value: value != null
            ? CategoriesList.values.byName(value)
            : CategoriesList.values.first),
    OptionFieldType.boolean => throw UnimplementedError(),

  };
}

class OptionString extends Option {
  String? value;

  OptionString({required super.optionField, this.value})
      : super(optionFieldType: OptionFieldType.string);

  OptionString factory(OptionField optionField) {
    return OptionString(optionField: optionField);
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

class OptionInt extends Option {
  OptionIntRange range;
  int lowValue;
  int highValue;

  factory OptionInt(OptionField optionField, OptionIntRange optionIntRange, int? low, int? high) {
    int lowValue = low ?? optionIntRange.low.round();
    int highValue = high ?? optionIntRange.high.round();
    if (lowValue < optionIntRange.low.round()) {
      lowValue = optionIntRange.low.round();
    }
    if (highValue > optionIntRange.high.round()) {
      highValue = optionIntRange.high.round();
    }

    return  OptionInt._(optionField: optionField, range: optionIntRange, lowValue:  lowValue, highValue:  highValue);
  }


  OptionInt._(
      {required super.optionField,
      required this.range,
      required this.lowValue,
      required this.highValue})
      : super(optionFieldType: OptionFieldType.int);

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
    return highValue;
  }
}

abstract class OptionBoolean implements Option {}

class OptionDropdownList<T extends Enum> extends Option {
  DropdownListElement value;
  OptionFieldType type = OptionFieldType.dropdown;

  OptionDropdownList({required super.optionField, required this.value})
      : super(optionFieldType: OptionFieldType.dropdown);

  @override
  bool hasValue() {
    return true;
  }

  @override
  Operator? getOperator() {
    return null;
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
