import 'package:bgsearchapp/2_application/options/library/option_fields.dart';
import 'package:bgsearchapp/2_application/options/library/option_int_ranges.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../0_data/repository.dart';
import '../1_domain/game_entity.dart';
import '../3_presentation/pages/settings.dart';
import 'options/options.dart';

class StateManager extends ChangeNotifier {
  StateManager(this.isar);

  // todo implement repository pattern with interface
  int pageIndex = 0;

  List<Option> searchOptions = [
    OptionString(optionField: OptionField.nameContains),
    OptionInt(OptionField.age, OptionIntRange.age, null, null)
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

  Map<int, List<GameShortInfo>> searchResultPages = {};
  Map<int, GameDetailedInfo> searchResultsDetails= {};

  late Isar isar;
  late Stream<void> searchOptionsChanged;

  int results_page = 0;
  bool hasNewFilters = true;

  HttpSearchRepository repository = HttpSearchRepository();

  ExtendedThemeMode themeMode = ExtendedThemeMode.system;

  setPageIndex(int i) {
    pageIndex = i;
    notifyListeners();
  }

  retrieveSearchResults(int page) async {
    if (hasNewFilters) {
      hasNewFilters = false;
      searchResultPages.clear();
      var infos = await repository.getShortGameInfos(searchOptions, page);
      searchResultPages[page] = infos;
      notifyListeners();
    } else {
      if (!searchResultPages.containsKey(page)) {
        searchResultPages[page] = await repository.getShortGameInfos(searchOptions, page);
        notifyListeners();
      }
    }
  }

  retrieveDetailedInfo(int id) async {
    if (!searchResultsDetails.containsKey(id)) {
      searchResultsDetails[id] =
      await repository.getDetailedInfo(id);
      notifyListeners();
    }
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
    hasNewFilters = true;
    notifyListeners();
  }

  removeSearchOption(Option option) {
    searchOptions.remove(option);
    hasNewFilters = true;
    notifyListeners();
  }

  setSearchOptions(List<Option> newSearchOptions) {
    searchOptions = newSearchOptions;
    hasNewFilters = true;
    notifyListeners();
  }

  setThemeModeToggle(int index) {
    themeMode = themeMode.getFromIndex(index);
    notifyListeners();
  }
}
