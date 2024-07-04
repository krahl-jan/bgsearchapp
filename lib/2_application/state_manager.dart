import 'package:bgsearch/1_domain/favourite_list.dart';
import 'package:bgsearch/2_application/filters/library/filter_types.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../0_data/repository.dart';
import '../1_domain/game_entity.dart';
import '../1_domain/repository_interface.dart';
import '../3_presentation/pages/settings/settings.dart';
import 'filters/filters.dart';

class StateManager extends ChangeNotifier {
  StateManager(this.isar);

  // todo implement repository pattern with interface
  int pageIndex = 0;

  List<Filter> searchFilters = [];

  bool isFilterSelected(FilterEnum filter) {
    for (var o in searchFilters) {
      if (o.filterType.displayString == filter.displayString) {
        return true;
      }
    }
    return false;
  }

  List<GameShortInfo> favourites = List.empty(growable: true);

  Map<int, List<GameShortInfo>> searchResultPages = {};
  Map<int, GameDetailedInfo> searchResultsDetails= {};

  late Isar isar;

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
      var infos = await repository.getShortGameInfos(searchFilters, page);
      searchResultPages[page] = infos;
      notifyListeners();
    } else {
      if (!searchResultPages.containsKey(page)) {
        searchResultPages[page] = await repository.getShortGameInfos(searchFilters, page);
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
    loadFavourites();
    if (!favourites.contains(info)) {
      favourites.add(info);
      notifyListeners();
      print("Added ${info.id} to favourites");
      saveFavourites();
    }
  }

  removeFavourite(GameShortInfo info) {
    loadFavourites();
    if (favourites.contains(info)) {
      favourites.remove(info);
      notifyListeners();
      print("Removed $info to favourites");
      saveFavourites();
    }
  }

  addSearchFilter(Filter filter) {
    searchFilters.add(filter);
    hasNewFilters = true;
    notifyListeners();
  }

  removeSearchFilter(Filter filter) {
    searchFilters.remove(filter);
    hasNewFilters = true;
    notifyListeners();
  }

  setSearchFilters(List<Filter> newSearchFilters) {
    searchFilters = newSearchFilters;
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
