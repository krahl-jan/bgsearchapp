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
  String name;
  String imageUri;
  String description;

  GameDetailedInfo(this.id, this.name, this.imageUri, this.description);
}