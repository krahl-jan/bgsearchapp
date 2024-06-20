import 'package:bgsearchapp/2_application/operators.dart';

abstract class Option {
  String getQuery();
}

class OptionName implements Option {
  String? name;

  OptionName(
    this.name,
  );

  @override
  String getQuery() {
    return 'n:"$name"';
  }
}

class OptionAge implements Option {
  int? age;
  Operator? operator;

  OptionAge(
    this.age,
    this.operator,
  );

  @override
  String getQuery() {
    return "age$operator$age";
  }
}

class OptionCategories implements Option {
  List<String> categories = [];


  @override
  String getQuery() {
    String res = categories.map((c) => 'c:"$c"').join(" or ");
    return "($res)";
  }}