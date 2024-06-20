import 'package:test/test.dart';

import 'package:bgsearchapp/2_application/options.dart';
import 'package:bgsearchapp/2_application/operators.dart';

void main() {
  test('Test age option', () {
    var option = OptionAge(2, Operator.equal);
    assert(option.getQuery()=="age=2");

    option = OptionAge(10, Operator.lessEqual);
    assert(option.getQuery()=="age<=10");

  });

  test('Test name option', () {
    var option = OptionName("catan");
    assert(option.getQuery()=='n:"catan"');

    option = OptionName("settlers of catan");
    assert(option.getQuery()=='n:"settlers of catan"');

  });
}