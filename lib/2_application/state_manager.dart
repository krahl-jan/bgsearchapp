import 'package:bgsearchapp/1_domain/favourite_list.dart';
import 'package:bgsearchapp/2_application/options/library/option_fields.dart';
import 'package:bgsearchapp/2_application/options/library/option_int_ranges.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../0_data/repository.dart';
import '../1_domain/game_entity.dart';
import '../1_domain/repository_interface.dart';
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

  List<GameShortInfo> favourites = List.empty(growable: true);

  Map<int, List<GameShortInfo>> searchResultPages = {};
  Map<int, GameDetailedInfo> searchResultsDetails= {};

  late Isar isar;
  late Stream<void> searchOptionsChanged;

  int results_page = 0;

  void changeResultsPage(int page) {
    results_page = page;
    notifyListeners();
    retrieveSearchResults(page);
  }

  bool hasNewFilters = true;

  SearchRepository repository = HttpSearchRepository();

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

  addFavourite(GameShortInfo info) {
    if (!favourites.contains(info)) {
      favourites.add(info);
      notifyListeners();
      print("Added ${info.id} to favourites");
      saveFavourites();
    }
  }

  removeFavourite(GameShortInfo info) {
    if (favourites.contains(info)) {
      favourites.remove(info);
      notifyListeners();
      print("Removed $info to favourites");
      saveFavourites();
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

  saveFavourites() async {
    isar
        .writeTxn(() =>
        isar.favouriteListDBs.put(toFavouriteListDB(favourites)));
  }

  bool isFavouritesLoaded = false;

  loadFavourites() async {
    if (!isFavouritesLoaded) {
      isFavouritesLoaded = true;
      var res = await isar.favouriteListDBs.where().findAll();
      if (res.isEmpty) {
        return;
      }
      favourites.insertAll(0, res[0].favouriteList);
      notifyListeners();
    }
  }

  clearFavourites() async {
    isar.writeTxn(() => isar.favouriteListDBs.clear());
    favourites.clear();
    notifyListeners();
  }
}
