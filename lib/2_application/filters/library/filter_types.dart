import 'filter_int_ranges.dart';

enum FilterEnum {
  nameContains(
      displayString: "Name contains", filterType: FilterType.string, searchKey: "NAME"),
  age(displayString: "Age", filterType: FilterType.int, searchKey: "MIN_AGE"),
  maxPlaytime(
      displayString: "Max. Playtime", filterType: FilterType.int, searchKey: "MAX_TIME"),
  category(
      displayString: "Category", filterType: FilterType.dropdown, searchKey: "CATEGORY_NAME"),
  maxPlayers(
      displayString: "Max. Player Count", filterType: FilterType.int, searchKey: "MAX_PLAYERS"),
  bestPlayers(
      displayString: "Best Player Count", filterType: FilterType.int, searchKey: "MIN_PLAYERS_BEST"),
  bestOrGoodPlayerCount(
      displayString: "Good Player Count", filterType: FilterType.int, searchKey: "MIN_PLAYERS_REC"),
  releaseYear(
      displayString: "Release Year", filterType: FilterType.int, searchKey: "YEAR"),
      ;

  const FilterEnum({
    required this.displayString,
    required this.filterType,
    required this.searchKey,
  });

  String getDisplayString() {
    return displayString;
  }

  final String displayString;
  final FilterType filterType;
  final String searchKey;
}

enum FilterType {
  int,
  string,
  boolean,
  dropdown;
}

var intRangeMap = <FilterEnum, OptionIntRange>{
  FilterEnum.age: OptionIntRange.age,
  FilterEnum.bestOrGoodPlayerCount: OptionIntRange.bestOrGoodPlayerCount,
  FilterEnum.bestPlayers: OptionIntRange.bestPlayers,
  FilterEnum.maxPlaytime: OptionIntRange.maxPlaytime,
  FilterEnum.maxPlayers: OptionIntRange.maxPlayers,
  FilterEnum.releaseYear: OptionIntRange.releaseYear,
};
