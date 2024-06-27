enum Operator {
  equal(string: "="),
  lessThan(string: "<"),
  greaterThan(string: ">"),
  lessEqual(string: "<="),
  greaterEqual(string: ">="),
  ;

  const Operator({
    required this.string,
    });

  @override
  String toString() {
    return string;
  }

  final String string;

}

Operator operatorFromString(String s) {
  for (var v in Operator.values) {
    if (v.toString() == s) {
      return v;
    }
  }
  return Operator.equal;
}