// option types:

// field contains string
// filed comparison with int/float
// boolean
// select string(s) from choice

import 'operators.dart';

abstract class Option {
  String getName();
}

class OptionString implements Option {
  String value = "";
  String name;

  OptionString({required this.name});

  @override
  String getName() {
    return name;
  }
}

class OptionInt implements Option {
  int value;
  String name;
  Operator operator;

  OptionInt({required this.name, required this.value, required this.operator});

  @override
  String getName() {
    return name;
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