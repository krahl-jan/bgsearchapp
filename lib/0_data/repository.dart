import 'dart:async';
import 'package:html_unescape/html_unescape.dart';
import 'package:bgsearchapp/1_domain/game_entity.dart';
import 'package:bgsearchapp/2_application/options/library/option_fields.dart';
import 'package:bgsearchapp/2_application/options/options.dart';

import 'package:http/http.dart' as http;

String baseUri = "https://bgs.nafarlee.dev/";

class HttpSearchRepository {
  Future<List<GameShortInfo>> getShortGameInfos(List<Option> options) async {
    String query =
        [for (var option in options) optionToQueryString(option)].join(" ");
    print("query: ${query}");

    http.Response response = await http.get(Uri.parse(
        "${baseUri}search?query=$query&limit=30&order=bayes_rating&direction=DESC"));

    Iterable<RegExpMatch> matches =
        RegExp(r'img src="/image-mirror/([^"]*).*?/games/(\d+)">([^<]*)')
            .allMatches(response.body);

    List<GameShortInfo> result = [];

    for (final match in matches) {
      int id = int.parse(match.group(2) ?? "-1");
      String name = match.group(3) ?? "error";
      String imageUri = match.group(1) ?? "";
      result.add(GameShortInfo(id, name, imageUri));
    }

    return result;
  }

  Future<GameDetailedInfo> getDetailedInfo(int id) async {
    http.Response response = await http.get(Uri.parse("${baseUri}games/$id"));
    Iterable<RegExpMatch> matches = RegExp(
            r'<h1 class="text-center">([^<]*)</h1>[\s\S]*?src=".*?image-mirror/([^"]*)[\s\S]*?<summary>Description</summary>[\s\S]*?<p>([\s\S]*?)</p>[\s\S]*?<summary>Rating</summary>[\s\S]*?Votes: ([\s\S]*?)</li>[\s\S]*?Average: ([\s\S]*?)</li>[\s\S]*?<summary>Playtime</summary>[\s\S]*?Minimum: ([\s\S]*?)</li>[\s\S]*?Maximum: ([\s\S]*?)</li>[\s\S]*?<summary>Players</summary>[\s\S]*?Minimum: ([\s\S]*?)</li>[\s\S]*?Maximum: ([\s\S]*?)</li>[\s\S]*?<summary>Weight</summary>[\s\S]*?Votes: ([\s\S]*?)</li>[\s\S]*?Average: ([\s\S]*?)</li>')
        .allMatches(response.body);
    var match = matches.first;
    String name = match.group(1) ?? "";
    String uri = match.group(2) ?? "";
    String description = match.group(3) ?? "";
    String ratingVotes = match.group(4) ?? "";
    String rating = match.group(5) ?? "";
    String minPlaytime = match.group(6) ?? "";
    String maxPlaytime = match.group(7) ?? "";
    String minPlayers = match.group(8) ?? "";
    String maxPlayers = match.group(9) ?? "";
    String weightVotes = match.group(10) ?? "";
    String weight = match.group(11) ?? "";
    var unescape = new HtmlUnescape();
    var result = GameDetailedInfo(
        id,
        name,
        uri,
        unescape.convert(description),
        double.parse(rating),
        int.parse(ratingVotes),
        int.parse(minPlaytime),
        int.parse(maxPlaytime),
        int.parse(minPlayers),
        int.parse(maxPlayers),
        double.parse(weight),
        int.parse(weightVotes));

    return result;
  }

  String optionToQueryString(Option option) {
    if (!option.hasValue()) {
      return "";
    }
    return switch (option.optionField) {
      OptionField.nameContains =>
        'name:"${(option as OptionString).value.toString()}"',
      OptionField.age =>
        "age>=${(option as OptionInt).lowValue.toString()} age<=${(option).highValue.toString()}",
      OptionField.maxPlaytime =>
        "max-playtime>=${(option as OptionInt).lowValue.toString()} max-playtime<=${(option).highValue.toString()}",
      OptionField.category =>
        'category:"${(option as OptionDropdownList).value.getDisplayString()}"',
      OptionField.bestPlayers =>
        "best-players>=${(option as OptionInt).lowValue.toString()} best-players<=${(option).highValue.toString()}",
      OptionField.maxPlayers =>
        "max-players>=${(option as OptionInt).lowValue.toString()} max-players<=${(option).highValue.toString()}",
      OptionField.bestOrGoodPlayerCount =>
        "quorum-players>=${(option as OptionInt).lowValue.toString()} quorum-players<=${(option).highValue.toString()}",
      OptionField.descriptionContains =>
        'desc:"${(option as OptionString).value.toString()}"',
    };
  }
}
