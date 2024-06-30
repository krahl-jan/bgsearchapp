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

  Operator? getOperator();

  Option(
      {required this.optionField, required OptionFieldType optionFieldType}) {
    if (optionField.optionFieldType != optionFieldType)
      throw const FormatException("option field types dont match");
  }
}

Option optionFactory(
    {required OptionField optionField, Operator? operator, String? value}) {
  return switch (optionField.optionFieldType) {
    OptionFieldType.string =>
      OptionString(optionField: optionField, value: value),
    OptionFieldType.int => OptionInt(
        optionField: optionField,
        value: value != null ? int.tryParse(value) : null,
        operator: operator ?? Operator.lessEqual,
        ranges: OptionIntRanges.age),
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
  Operator? getOperator() {
    return null;
  }
}

class OptionInt extends Option {
  int? value;
  int? highValue;
  Operator operator;
  OptionIntRanges ranges;

  OptionInt(
      {required super.optionField,
      this.operator = Operator.lessEqual,
      this.value,
      this.highValue,
      required this.ranges})
      : super(optionFieldType: OptionFieldType.int);

  @override
  bool hasValue() {
    return value != null;
  }

  @override
  Operator? getOperator() {
    return operator;
  }

  @override
  getValue() {
    return value;
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
}
