import 'package:bgsearchapp/2_application/operators.dart';
import 'package:bgsearchapp/2_application/options/library/option_fields.dart';
import 'package:flutter/material.dart';

import '../0_data/repository.dart';
import 'options/options.dart';

class StateManager extends ChangeNotifier {
  int pageIndex = 0;

  // todo implement repository pattern with interface
  HttpSearchRepository repository = HttpSearchRepository();

  setPageIndex(int i) {
    pageIndex = i;
    notifyListeners();
  }

  List<Option> searchOptions = [
    OptionString(name: "Name"),
    OptionInt(name: "Age", value: 18, operator: Operator.lessEqual)
  ];
}
