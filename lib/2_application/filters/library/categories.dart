import 'package:bgsearch/2_application/filters/library/dropdown_element.dart';

enum CategoriesList implements DropdownListElement {
  cardGame(displayString: "Card Game", linkString: "Card Game"),
  wargame(displayString: "Wargame", linkString: "Wargame"),
  fantasy(displayString: "Fantasy", linkString: "Fantasy"),
  childrensGame(
      displayString: "Children's Game", linkString: "Children's Game"),
  miniatures(displayString: "Miniatures", linkString: "Miniatures"),
  dice(displayString: "Dice", linkString: "Dice"),
  partyGame(displayString: "Party Game", linkString: "Party Game"),
  scienceFiction(
      displayString: "Science Fiction", linkString: "Science Fiction"),
  fighting(displayString: "Fighting", linkString: "Fighting"),
  abstractStrategy(
      displayString: "Abstract Strategy", linkString: "Abstract Strategy"),
  educational(displayString: "Educational", linkString: "Educational"),
  printAndPlay(displayString: "Print & Play", linkString: "Print & Play"),
  economic(displayString: "Economic", linkString: "Economic"),
  animals(displayString: "Animals", linkString: "Animals"),
  moviesTvRadioTheme(
      displayString: "Movies / TV / Radio theme",
      linkString: "Movies / TV / Radio theme"),
  trivia(displayString: "Trivia", linkString: "Trivia"),
  adventure(displayString: "Adventure", linkString: "Adventure"),
  humor(displayString: "Humor", linkString: "Humor"),
  worldWarIi(displayString: "World War II", linkString: "World War II"),
  actionDexterity(
      displayString: "Action / Dexterity", linkString: "Action / Dexterity"),
  sports(displayString: "Sports", linkString: "Sports"),
  deduction(displayString: "Deduction", linkString: "Deduction"),
  medieval(displayString: "Medieval", linkString: "Medieval"),
  racing(displayString: "Racing", linkString: "Racing"),
  bluffing(displayString: "Bluffing", linkString: "Bluffing"),
  exploration(displayString: "Exploration", linkString: "Exploration"),
  book(displayString: "Book", linkString: "Book"),
  horror(displayString: "Horror", linkString: "Horror"),
  wordGame(displayString: "Word Game", linkString: "Word Game"),
  negotiation(displayString: "Negotiation", linkString: "Negotiation"),
  puzzle(displayString: "Puzzle", linkString: "Puzzle"),
  memory(displayString: "Memory", linkString: "Memory"),
  nautical(displayString: "Nautical", linkString: "Nautical"),
  ancient(displayString: "Ancient", linkString: "Ancient"),
  realTime(displayString: "Real Time", linkString: "Real-time"),
  novelBased(displayString: "Novel Based", linkString: "Novel-based"),
  collectibleComponents(
      displayString: "Collectible Components",
      linkString: "Collectible Components"),
  political(displayString: "Political", linkString: "Political"),
  travel(displayString: "Travel", linkString: "Travel"),
  territoryBuilding(
      displayString: "Territory Building", linkString: "Territory Building"),
  modernWarfare(
      displayString: "Modern Warfare", linkString: "Modern Warfare"),
  aviationFlight(
      displayString: "Aviation / Flight", linkString: "Aviation / Flight"),
  murdermystery(
      displayString: "Murder / Mystery", linkString: "Murder / Mystery"),
  cityBuilding(
      displayString: "City Building", linkString: "City Building"),
  mythology(displayString: "Mythology", linkString: "Mythology"),
  math(displayString: "Math", linkString: "Math"),
  transportation(
      displayString: "Transportation", linkString: "Transportation"),
  videoGameTheme(
      displayString: "Video GameTheme", linkString: "Video Game Theme"),
  spaceExploration(
      displayString: "Space Exploration", linkString: "Space Exploration"),
  trains(displayString: "Trains", linkString: "Trains"),
  environmental(
      displayString: "Environmental", linkString: "Environmental"),
  civilization(
      displayString: "Civilization", linkString: "Civilization"),
  pirates(displayString: "Pirates", linkString: "Pirates"),
  number(displayString: "Number", linkString: "Number"),
  zombies(displayString: "Zombies", linkString: "Zombies"),
  industryManufacturing(
      displayString: "Industry Manufacturing",
      linkString: "Industry / Manufacturing"),
  religious(displayString: "Religious", linkString: "Religious"),
  farming(displayString: "Farming", linkString: "Farming"),
  music(displayString: "Music", linkString: "Music"),
  civilWar(displayString: "Civil War", linkString: "Civil War"),
  fanExpansion(displayString: "Fan Expansion", linkString: "Fan Expansion"),
  mafia(displayString: "Mafia", linkString: "Mafia"),
  medical(displayString: "Medical", linkString: "Medical"),

  // Missing entries from CSV:
  expansionForBaseGame(
      displayString: "Expansion for Base-game",
      linkString: "Expansion for Base-game"),
  americanCivilWar(
      displayString: "American Civil War", linkString: "American Civil War"),
  napoleonic(
      displayString: "Napoleonic", linkString: "Napoleonic"),
  arabian(displayString: "Arabian", linkString: "Arabian"),
  americanWest(
      displayString: "American West", linkString: "American West"),
  maze(displayString: "Maze", linkString: "Maze"),
  worldWarI(
      displayString: "World War I", linkString: "World War I"),
  renaissance(
      displayString: "Renaissance", linkString: "Renaissance"),
  electronic(
      displayString: "Electronic", linkString: "Electronic"),
  americanRevolutionaryWar(
      displayString: "American Revolutionary War",
      linkString: "American Revolutionary War"),
  spiesSecretAgents(
      displayString: "Spies / Secret Agents",
      linkString: "Spies / Secret Agents"),
  koreanWar(
      displayString: "Korean War", linkString: "Korean War"),
  americanIndianWars(
      displayString: "American Indian Wars",
      linkString: "American Indian Wars"),
  vietnamWar(
      displayString: "Vietnam War", linkString: "Vietnam War"),
  comicBookStrip(
      displayString: "Comic Book / Strip",
      linkString: "Comic Book / Strip"),
  matureAdult(
      displayString: "Mature / Adult", linkString: "Mature / Adult"),
  gameSystem(
      displayString: "Game System", linkString: "Game System"),
  postNapoleonic(
      displayString: "Post-Napoleonic", linkString: "Post-Napoleonic"),
  pikeAndShot(
      displayString: "Pike and Shot", linkString: "Pike and Shot"),
  ageOfReason(
      displayString: "Age of Reason", linkString: "Age of Reason"),
  ;

  const CategoriesList({
    required this.displayString,
    required this.linkString
  });

  @override
  String getDisplayString() {
    return displayString;
  }

  @override
  String getLinkString() {
    return linkString;
  }

  @override
  List<DropdownListElement> getAllValues() {
    return CategoriesList.values;
  }

  @override
  DropdownListElement factoryFromString(String s) {
    for (var v in CategoriesList.values) {
      if (v.linkString == s) {
        return v;
      }
    }
    return CategoriesList.values.first;
  }

  final String displayString;
  final String linkString;

  @override
  String getName() {
    return name;
  }

}