import 'package:bgsearchapp/2_application/options/library/option_int_ranges.dart';

enum OptionField {
  nameContains(
      displayString: "Name contains", optionFieldType: OptionFieldType.string),
  descriptionContains(
      displayString: "Description contains",
      optionFieldType: OptionFieldType.string),
  age(displayString: "Age", optionFieldType: OptionFieldType.int),
  maxPlaytime(
      displayString: "Max. Playtime", optionFieldType: OptionFieldType.int),
  category(
      displayString: "Category", optionFieldType: OptionFieldType.dropdown),
  maxPlayers(
      displayString: "Max. Player Count", optionFieldType: OptionFieldType.int),
  bestPlayers(
      displayString: "Best Player Count", optionFieldType: OptionFieldType.int),
  bestOrGoodPlayerCount(
      displayString: "Good Player Count", optionFieldType: OptionFieldType.int),
  releaseYear(
      displayString: "Release Year", optionFieldType: OptionFieldType.int),
      ;

  const OptionField({
    required this.displayString,
    required this.optionFieldType,
  });

  String getDisplayString() {
    return displayString;
  }

  final String displayString;
  final OptionFieldType optionFieldType;
}

enum OptionFieldType {
  int,
  string,
  boolean,
  dropdown;
}

var intRangeMap = <OptionField, OptionIntRange>{
  OptionField.age: OptionIntRange.age,
  OptionField.bestOrGoodPlayerCount: OptionIntRange.bestOrGoodPlayerCount,
  OptionField.bestPlayers: OptionIntRange.bestPlayers,
  OptionField.maxPlaytime: OptionIntRange.maxPlaytime,
  OptionField.maxPlayers: OptionIntRange.maxPlayers,
  OptionField.releaseYear: OptionIntRange.releaseYear,
};
