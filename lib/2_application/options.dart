// option types:

// field contains string
// filed comparison with int/float
// boolean
// select string(s) from choice

abstract class Option {
  int getType();
  String getName();
  int getOrder();
}

class OptionString implements Option {
  String value = "";
  String name;
  int order;

  OptionString({required this.name, required this.order});

  setValue(String value) {
    this.value = value;
  }

  @override
  int getType() {
    return 0;
  }

  @override
  String getName() {
    return name;
  }

  @override
  int getOrder() {
    return order;
  }
}

class OptionInt implements Option {
  int value;
  String name;
  int order;

  OptionInt({required this.name, required this.order, required this.value});

  @override
  int getType() {
    return 1;
  }

  @override
  String getName() {
    return name;
  }

  @override
  int getOrder() {
    return order;
  }
}

abstract class OptionFloat implements Option {
  @override
  int getType() {
    return 2;
  }
}

abstract class OptionBoolean implements Option {
  @override
  int getType() {
    return 3;
  }
}

abstract class OptionStrings implements Option {
  @override
  int getType() {
    return 4;
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