import 'dart:async';
import 'package:bgsearch/1_domain/game_entity.dart';
import 'package:bgsearch/2_application/filters/filters.dart';



String baseUri = "https://bgs.nafarlee.dev/";

abstract class SearchRepository {
  Future<List<GameShortInfo>> getShortGameInfos(List<Filter> options, int page);
  Future<GameDetailedInfo> getDetailedInfo(int id);
}
