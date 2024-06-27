import 'dart:async';
import 'package:bgsearchapp/1_domain/game_entity.dart';
import 'package:bgsearchapp/2_application/options/library/option_fields.dart';
import 'package:bgsearchapp/2_application/options/options.dart';

import 'package:http/http.dart' as http;

String baseUri = "https://bgs.nafarlee.dev/";

class HttpSearchRepository {
  Future<List<GameShortInfo>> getShortGameInfos(List<Option> options) async {

    String query = [for (var option in options) optionToQueryString(option)].join(" ");
    print("query: ${query}");

    http.Response response = await http.get(Uri.parse(baseUri + "search?query=" + query + "&limit=30&order=bayes_rating&direction=DESC"));

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
    if (!option.hasValue()) {
      return "";
    }
    return switch (option.getOptionField()) {
      OptionField.age => 'name:"${(option as OptionString).value.toString()}"',
      OptionField.nameContains => "age${(option as OptionInt).operator.toString()}${(option).value.toString()}",
      OptionField.maxPlaytime => "max-playtime${(option as OptionInt).operator.toString()}${(option).value.toString()}",
      OptionField.category => "",
      OptionField.bestPlayers => "best-players${(option as OptionInt).operator.toString()}${(option).value.toString()}",
      OptionField.maxPlayers => "max-players${(option as OptionInt).operator.toString()}${(option).value.toString()}",
      OptionField.bestOrGoodPlayerCount => "quorum-players${(option as OptionInt).operator.toString()}${(option).value.toString()}",
    };
  }

}