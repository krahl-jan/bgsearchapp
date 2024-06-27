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
  OptionField getOptionField();
  bool hasValue();
}

Option optionFactory(OptionField optionField) {
  switch (optionField) {
    case OptionField.nameContains: {
      return OptionString(optionField: optionField);
    }
    case OptionField.age:
      return OptionInt(optionField: optionField, operator: Operator.lessEqual);
    case OptionField.maxPlaytime:
      return OptionInt(optionField: optionField, operator: Operator.lessEqual);
    case OptionField.category:
      return OptionDropdownList<CategoriesList>(optionField: optionField, value: CategoriesList.values.first);
    case OptionField.bestPlayers:
      return OptionInt(optionField: optionField, operator: Operator.lessEqual);
    case OptionField.maxPlayers:
      return OptionInt(optionField: optionField, operator: Operator.lessEqual);
    case OptionField.bestOrGoodPlayerCount:
      return OptionInt(optionField: optionField, operator: Operator.lessEqual);
  }
  
}

class OptionString implements Option {
  String? value;
  OptionField optionField;

  OptionString({required this.optionField});

  @override
  OptionField getOptionField() {
    return optionField;
  }

  OptionString factory(OptionField optionField) {
    return OptionString(optionField: optionField);
  }

  @override
  bool hasValue() {
    return value != null;
  }
}

class OptionInt implements Option {
  int? value;
  OptionField optionField;
  Operator operator;

  OptionInt({required this.optionField, required this.operator});

  @override
  OptionField getOptionField() {
    return optionField;
  }

  @override
  bool hasValue() {
    return value != null;
  }
}

abstract class OptionBoolean implements Option {

}

class OptionDropdownList<T extends Enum> implements Option {

  OptionField optionField;
  DropdownListElement value;

  OptionDropdownList({required this.optionField, required this.value});

  @override
  OptionField getOptionField() {
    return optionField;
  }

  @override
  bool hasValue() {
    return (value != null);
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