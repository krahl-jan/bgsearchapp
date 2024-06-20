class GameShortInfo {
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