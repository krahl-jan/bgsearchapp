import 'package:bgsearchapp/2_application/operators.dart';
import 'package:bgsearchapp/2_application/options/library/option_fields.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../0_data/repository.dart';
import '../1_domain/game_entity.dart';
import 'options/options.dart';

class StateManager extends ChangeNotifier {
  StateManager(this.isar);
  // todo implement repository pattern with interface
  int pageIndex = 0;

  List<Option> searchOptions = [
    OptionString(optionField: OptionField.nameContains),
    OptionInt(optionField: OptionField.age, operator: Operator.lessEqual)
  ];

  List<GameShortInfo> searchResults = [];

  late Isar isar;
  late Stream<void> searchOptionsChanged;


  HttpSearchRepository repository = HttpSearchRepository();

  setPageIndex(int i) {
    pageIndex = i;
    notifyListeners();
  }

  retrieveSearchResults() async {
    searchResults.clear();
    var infos = await repository.getShortGameInfos(searchOptions);
    searchResults.addAll(infos);
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
