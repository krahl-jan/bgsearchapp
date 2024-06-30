import 'package:bgsearchapp/2_application/operators.dart';
import 'package:bgsearchapp/2_application/options/library/option_fields.dart';
import 'package:bgsearchapp/2_application/options/library/option_int_ranges.dart';
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
    OptionInt(optionField: OptionField.age, operator: Operator.lessEqual, ranges: OptionIntRanges.age)
  ];

  bool isOptionSelected(OptionField optionField) {
    for (var o in searchOptions) {
      if (o.optionField.displayString == optionField.displayString) {
        return true;
      }
    }
    return false;
  }

  List<int> favourites = [];

  List<GameShortInfo> searchResults = [];
  Map<int, GameDetailedInfo> searchResultsDetails= {};

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
    for (var info in infos) {
      if (!searchResultsDetails.containsKey(info.id)) {
        searchResultsDetails[info.id] =
        await repository.getDetailedInfo(info.id);
      }
    }
    notifyListeners();
  }

  addFavourite(int id) {
    if (!favourites.contains(id)) {
      favourites.add(id);
      notifyListeners();
      print("Added $id to favourites");
    }
  }

  removeFavourite(int id) {
    if (favourites.contains(id)) {
      favourites.remove(id);
      notifyListeners();
      print("Removed $id to favourites");
    }
  }

  addSearchOption(Option option) {
    searchOptions.add(option);
    notifyListeners();
  }

  removeSearchOption(Option option) {
    searchOptions.remove(option);
    notifyListeners();
  }

  setSearchOptions(List<Option> newSearchOptions) {
    searchOptions = newSearchOptions;
    notifyListeners();
  }
}
