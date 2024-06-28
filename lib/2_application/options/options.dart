// option types:

// field contains string
// filed comparison with int/float
// boolean
// select string(s) from choice

import 'package:bgsearchapp/2_application/options/library/categories.dart';

import '../operators.dart';
import 'library/dropdown_option.dart';
import 'library/option_fields.dart';

abstract class Option {
  final OptionField optionField;
  bool hasValue();

  Option({required this.optionField, required OptionFieldType optionFieldType}) {
    if (optionField.optionFieldType != optionFieldType) throw const FormatException("option field types dont match");
  }
}

Option optionFactory(OptionField optionField) {
  switch (optionField) {
    case OptionField.nameContains:
      return OptionString(optionField: optionField);
    case OptionField.age:
      return OptionInt(optionField: optionField);
    case OptionField.maxPlaytime:
      return OptionInt(optionField: optionField);
    case OptionField.category:
      return OptionDropdownList<CategoriesList>(optionField: optionField, value: CategoriesList.values.first);
    case OptionField.bestPlayers:
      return OptionInt(optionField: optionField);
    case OptionField.maxPlayers:
      return OptionInt(optionField: optionField);
    case OptionField.bestOrGoodPlayerCount:
      return OptionInt(optionField: optionField);
    case OptionField.descriptionContains:
      return OptionString(optionField: optionField);
  }
  
}

class OptionString extends Option {
  String? value;

  OptionString({required super.optionField, this.value}) : super(optionFieldType: OptionFieldType.string);

  OptionString factory(OptionField optionField) {
    return OptionString(optionField: optionField);
  }

  @override
  bool hasValue() {
    return value != null;
  }
}

class OptionInt extends Option {
  int? value;
  Operator operator;

  OptionInt({required super.optionField, this.operator = Operator.lessEqual}) : super(optionFieldType: OptionFieldType.int);

  @override
  bool hasValue() {
    return value != null;
  }
}

abstract class OptionBoolean implements Option {

}

class OptionDropdownList<T extends Enum> extends Option {

  DropdownListElement value;
  OptionFieldType type = OptionFieldType.dropdown;

  OptionDropdownList({required super.optionField, required this.value}) : super(optionFieldType: OptionFieldType.dropdown);

  @override
  bool hasValue() {
    return true;
  }

}

// class OptionName extends OptionString {
//   String? name;
//
//   OptionName(
//     this.name,
//   );
//
//   @override
//   String getName() {
//     return "Name";
//   }
// }
//
// class OptionAge extends OptionInt {
//   int? age;
//   Operator? operator;
//
//   OptionAge(
//     this.age,
//     this.operator,
//   );
//
//   @override
//   String getName() {
//     return "Age";
//   }
// }
//
// class OptionCategories implements Option {
//   List<String> categories = [];
//
//
//   @override
//   String getName() {
//     String res = categories.map((c) => 'c:"$c"').join(" or ");
//     return "($res)";
//   }}