import 'filter_int_ranges.dart';

enum FilterEnum {
  nameContains(
      displayString: "Name contains", filterType: FilterType.string),
  descriptionContains(
      displayString: "Description contains",
      filterType: FilterType.string),
  age(displayString: "Age", filterType: FilterType.int),
  maxPlaytime(
      displayString: "Max. Playtime", filterType: FilterType.int),
  category(
      displayString: "Category", filterType: FilterType.dropdown),
  maxPlayers(
      displayString: "Max. Player Count", filterType: FilterType.int),
  bestPlayers(
      displayString: "Best Player Count", filterType: FilterType.int),
  bestOrGoodPlayerCount(
      displayString: "Good Player Count", filterType: FilterType.int),
  releaseYear(
      displayString: "Release Year", filterType: FilterType.int),
      ;

  const FilterEnum({
    required this.displayString,
    required this.filterType,
  });

  String getDisplayString() {
    return displayString;
  }

  final String displayString;
  final FilterType filterType;
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
