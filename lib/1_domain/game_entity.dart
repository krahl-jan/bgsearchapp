import 'package:isar/isar.dart';

part 'game_entity.g.dart';

@embedded
class GameShortInfo {
  int? id;
  String? name;
  String? imageUri;

  GameShortInfo({this.id, this.name, this.imageUri});
}

class GameDetailedInfo {
  int id;
  String name;
  String imageUri;
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
      this.name,
      this.imageUri,
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
