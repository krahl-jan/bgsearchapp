// option types:

// field contains string
// filed comparison with int/float
// boolean
// select string(s) from choice

import '../operators.dart';
import 'library/option_fields.dart';

abstract class Option {
  OptionField getOptionField();
}

Option optionFactory(OptionField optionField) {
  if (optionField == OptionField.nameContains) {
    return OptionString(optionField: optionField);
  }
  if (optionField == OptionField.age) {
    return OptionInt(optionField: optionField, value: 12, operator: Operator.lessEqual);
  }
  return OptionString(optionField: optionField);
}



class OptionString implements Option {
  String value = "";
  OptionField optionField;

  OptionString({required this.optionField});

  @override
  OptionField getOptionField() {
    return optionField;
  }

  OptionString factory(OptionField optionField) {
    return OptionString(optionField: optionField);
  }
}

class OptionInt implements Option {
  int value;
  OptionField optionField;
  Operator operator;

  OptionInt({required this.optionField, required this.value, required this.operator});

  @override
  OptionField getOptionField() {
    return optionField;
  }
}

abstract class OptionFloat implements Option {

}

abstract class OptionBoolean implements Option {

}

abstract class OptionStrings implements Option {

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