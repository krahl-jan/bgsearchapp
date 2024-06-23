import 'package:bgsearchapp/2_application/operators.dart';
import 'package:flutter/material.dart';

import '../0_data/repository.dart';
import 'options.dart';

class StateManager extends ChangeNotifier {
  int pageIndex = 0;

  // todo implement repository pattern with interface
  HttpSearchRepository repository = HttpSearchRepository();

  setPageIndex(int i) {
    pageIndex = i;
    notifyListeners();
  }

  List<Option> searchOptions = [
    OptionString(name: "Name", order: 1),
    OptionInt(name: "Age", order: 2, value: 18, operator: Operator.lessEqual)
  ];
}
