import 'package:isar/isar.dart';

part 'game_entity.g.dart';

@collection
class GameShortInfo {
  Id dbId = Isar.autoIncrement;
  int id;
  String name;
  String imageUri;

  GameShortInfo(this.id, this.name, this.imageUri);
}

class GameDetailedInfo {
  int id;
  String description;
  float rating;
  int ratingVotes;
  int minPlaytime;
  int maxPlaytime;
  int minPlayers;
  int maxPlayers;
  float weight;
  int weightVotes;

  GameDetailedInfo(
      this.id,
      this.description,
      this.rating,
      this.ratingVotes,
      this.minPlaytime,
      this.maxPlaytime,
      this.minPlayers,
      this.maxPlayers,
      this.weight,
      this.weightVotes);
}
