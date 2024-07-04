import 'package:bgsearchapp/1_domain/game_entity.dart';
import 'package:isar/isar.dart';

part 'favourite_list.g.dart';

@collection
class FavouriteListDB {
  Id dbId = Isar.maxId;
  List<GameShortInfo> favouriteList = List.empty();

  FavouriteListDB(this.favouriteList);
}

FavouriteListDB toFavouriteListDB(List<GameShortInfo> favouriteList) {
  return FavouriteListDB(favouriteList);
}

List<GameShortInfo> toFavouriteList(FavouriteListDB list) {
  List<GameShortInfo> res = List.empty(growable: true);
  for (GameShortInfo i in list.favouriteList) {
    res.add(i);
  }
  return res;
}

