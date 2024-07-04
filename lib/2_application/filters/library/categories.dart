import 'package:bgsearch/2_application/filters/library/dropdown_element.dart';

enum CategoriesList implements DropdownListElement{
  cardGame(displayString: "Card Game", linkString: "card-game"),
  wargame(displayString: "Wargame", linkString: "wargame"),
  fantasy(displayString: "Fantasy", linkString: "fantasy"),
  childrensGame(displayString: "Children's Game", linkString: "childrens-game"),
  miniatures(displayString: "Miniatures", linkString: "miniatures"),
  dice(displayString: "Dice", linkString: "dice"),
  partyGame(displayString: "Party Game", linkString: "party-game"),
  scienceFiction(displayString: "Science Fiction", linkString: "science-fiction"),
  fighting(displayString: "Fighting", linkString: "fighting"),
  abstractStrategy(displayString: "Abstract Strategy", linkString: "abstract-strategy"),
  educational(displayString: "Educational", linkString: "educational"),
  printAndPlay(displayString: "Print & Play", linkString: "print-and-play"),
  economic(displayString: "Economic", linkString: "economic"),
  animals(displayString: "Animals", linkString: "animals"),
  moviesTvRadioTheme(displayString: "Movies / TV / Radio theme", linkString: "movies-tv-radio-theme"),
  trivia(displayString: "Trivia", linkString: "trivia"),
  adventure(displayString: "Adventure", linkString: "adventure"),
  humor(displayString: "Humor", linkString: "humor"),
  worldWarIi(displayString: "World War II", linkString: "world-war-ii"),
  actionDexterity(displayString: "Action / Dexterity", linkString: "action-dexterity"),
  sports(displayString: "Sports", linkString: "sports"),
  deduction(displayString: "Deduction", linkString: "deduction"),
  medieval(displayString: "Medieval", linkString: "medieval"),
  racing(displayString: "Racing", linkString: "racing"),
  bluffing(displayString: "Bluffing", linkString: "bluffing"),
  exploration(displayString: "Exploration", linkString: "exploration"),
  book(displayString: "Book", linkString: "book"),
  horror(displayString: "Horror", linkString: "horror"),
  wordGame(displayString: "Word Game", linkString: "word-game"),
  negotiation(displayString: "Negotiation", linkString: "negotiation"),
  puzzle(displayString: "Puzzle", linkString: "puzzle"),
  memory(displayString: "Memory", linkString: "memory"),
  nautical(displayString: "Nautical", linkString: "nautical"),
  ancient(displayString: "Ancient", linkString: "ancient"),
  realTime(displayString: "Real Time", linkString: "real-time"),
  novelBased(displayString: "Novel Based", linkString: "novel-based"),
  collectibleComponents(displayString: "Collectible Components", linkString: "collectible-components"),
  political(displayString: "Political", linkString: "political"),
  travel(displayString: "Travel", linkString: "travel"),
  territoryBuilding(displayString: "Territory Building", linkString: "territory-building"),
  modernWarfare(displayString: "Modern Warfare", linkString: "modern-warfare"),
  aviationFlight(displayString: "Aviation Flight", linkString: "aviation-flight"),
  murdermystery(displayString: "Murdermystery", linkString: "murdermystery"),
  cityBuilding(displayString: "City Building", linkString: "city-building"),
  mythology(displayString: "Mythology", linkString: "mythology"),
  math(displayString: "Math", linkString: "math"),
  transportation(displayString: "Transportation", linkString: "transportation"),
  videoGameTheme(displayString: "Video GameTheme", linkString: "video-game-theme"),
  spaceExploration(displayString: "Space Exploration", linkString: "space-exploration"),
  trains(displayString: "Trains", linkString: "trains"),
  environmental(displayString: "Environmental", linkString: "environmental"),
  civilization(displayString: "Civilization", linkString: "civilization"),
  pirates(displayString: "Pirates", linkString: "pirates"),
  number(displayString: "Number", linkString: "number"),
  zombies(displayString: "Zombies", linkString: "zombies"),
  industryManufacturing(displayString: "Industry Manufacturing", linkString: "industry-manufacturing"),
  religious(displayString: "Religious", linkString: "religious"),
  farming(displayString: "Farming", linkString: "farming"),
  music(displayString: "Music", linkString: "music"),
  civilWar(displayString: "Civil War", linkString: "civil-war"),
  fanExpansion(displayString: "Fan Expansion", linkString: "fan-expansion"),
  mafia(displayString: "Mafia", linkString: "mafia"),
  medical(displayString: "Medical", linkString: "medical"),
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