import 'dart:async';
import 'package:bgsearchapp/1_domain/game_entity.dart';

import 'package:http/http.dart' as http;

String baseUri = "https://bgs.nafarlee.dev/";

class HttpSearchRepository {
  Future<List<GameShortInfo>> getShortGameInfos(String query) async {
    http.Response response = await http.get(Uri.parse(baseUri + "search?query=" + query + "&limit=10&order=bayes_rating&direction=DESC"));

    Iterable<RegExpMatch> matches = RegExp(r'img src="/image-mirror/([^"]*).*?/games/(\d+)">([^<]*)').allMatches(response.body);

    List<GameShortInfo> result = [];

    for (final match in matches) {
      int id = int.parse(match.group(2) ?? "-1");
      String name = match.group(3) ?? "error";
      String imageUri = match.group(1) ?? "";
      result.add(GameShortInfo(id, name, imageUri));
    }

    return result;
  }
}