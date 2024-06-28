enum OptionField {
  nameContains(displayString: "Name contains"),
  descriptionContains(displayString: "Description contains"),
  age(displayString: "Age"),
  maxPlaytime(displayString: "Max. Playtime"),
  category(displayString: "Category"),
  bestPlayers(displayString: "Best Player Count"),
  maxPlayers(displayString: "Max Player Count"),
  bestOrGoodPlayerCount(displayString: "Good or Best Player Count")
  ;

  const OptionField({
    required this.displayString,
  });

  String getDisplayString() {
    return displayString;
  }

  final String displayString;

}