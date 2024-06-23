import 'dart:async';
import 'package:bgsearchapp/1_domain/game_entity.dart';
import 'package:bgsearchapp/2_application/options.dart';

import 'package:http/http.dart' as http;

String baseUri = "https://bgs.nafarlee.dev/";

class HttpSearchRepository {
  Future<List<GameShortInfo>> getShortGameInfos(List<Option> options) async {

    String query = [for (var option in options) optionToQueryString(option)].join(" ");

    print("query: ${query}");

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

  String optionToQueryString(Option option) {
    if (option.getName() == "Age") {
      return "age${(option as OptionInt).operator.toString()}${(option as OptionInt).value.toString()}";
    }
    if (option.getName() == "Name") {
      return 'name:"${(option as OptionString).value.toString()}"';
    }
    return "";
  }

}