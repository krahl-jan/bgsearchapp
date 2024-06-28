enum OptionField {
  nameContains(displayString: "Name contains", optionFieldType: OptionFieldType.string),
  descriptionContains(displayString: "Description contains", optionFieldType: OptionFieldType.string),
  age(displayString: "Age", optionFieldType: OptionFieldType.int),
  maxPlaytime(displayString: "Max. Playtime", optionFieldType: OptionFieldType.int),
  category(displayString: "Category", optionFieldType: OptionFieldType.dropdown),
  maxPlayers(displayString: "Max. Player Count", optionFieldType: OptionFieldType.int),
  bestPlayers(displayString: "Best Player Count", optionFieldType: OptionFieldType.int),
  bestOrGoodPlayerCount(displayString: "Good Player Count", optionFieldType: OptionFieldType.int)
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
  dropdown
  ;
}