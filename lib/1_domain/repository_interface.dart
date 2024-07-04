import 'dart:async';
import 'package:bgsearchapp/1_domain/game_entity.dart';
import 'package:bgsearchapp/2_application/filters/filters.dart';



String baseUri = "https://bgs.nafarlee.dev/";

abstract class SearchRepository {
  Future<List<GameShortInfo>> getShortGameInfos(List<Filter> options, int page);
  Future<GameDetailedInfo> getDetailedInfo(int id);
}
