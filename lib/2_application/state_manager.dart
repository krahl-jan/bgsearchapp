import 'package:bgsearchapp/2_application/operators.dart';
import 'package:bgsearchapp/2_application/options/library/option_fields.dart';
import 'package:flutter/material.dart';

import '../0_data/repository.dart';
import 'options/options.dart';

class StateManager extends ChangeNotifier {
  // todo implement repository pattern with interface
  int pageIndex = 0;

  List<Option> searchOptions = [
    OptionString(optionField: OptionField.nameContains),
    OptionInt(optionField: OptionField.age, value: 18, operator: Operator.lessEqual)
  ];

  HttpSearchRepository repository = HttpSearchRepository();

  setPageIndex(int i) {
    pageIndex = i;
    notifyListeners();
  }

  addSearchOption(Option option) {
    searchOptions.add(option);
    notifyListeners();
  }

  removeSearchOption(Option option) {
    searchOptions.remove(option);
    notifyListeners();
  }
}
