import 'dart:async';
import 'dart:convert';

import 'package:bgsearch/1_domain/game_entity.dart';
import 'package:bgsearch/1_domain/repository_interface.dart';
import 'package:bgsearch/2_application/filters/filters.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

String bgSearchUri = "https://bgsearch.duckdns.org";
String shortInfoUri = "$bgSearchUri/boardgame/short";
String bggBaseUri = 'https://boardgamegeek.com/xmlapi/boardgame';

class HttpSearchRepository implements SearchRepository {
  int resultsPerPage = 10;

  Future<List<GameShortInfo>> getShortGameInfos(
      List<Filter> options, int page) async {
    String jsonBody = getRequestBody(options);

    http.Response response = await http.post(
        Uri.parse(
            "$shortInfoUri?pageNumber=$page&pageSize=$resultsPerPage"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonBody);

    print(jsonBody);
    print(response.request);
    print(response.body);

    Map<String, dynamic> decoded = jsonDecode(utf8.decode(response.bodyBytes));
    if (decoded['boardGameItems'] == null) {
      return [];
    }
    List<dynamic> boardGameItems = decoded['boardGameItems'] as List<dynamic>;
    int totalElements = decoded['totalElements'] as int;

    Map<int, GameShortInfo> result = {};
    for (var e in boardGameItems) {
      var gameShortInfo = GameShortInfo.fromJson(e);
      if (gameShortInfo.id != null) {
        result[gameShortInfo.id!] = gameShortInfo;
      }
    }

    String ids = result.keys.map((k) => k.toString()).join(',');
    http.Response imageUriResponse =
        await http.get(Uri.parse("$bggBaseUri/$ids"));
    print(imageUriResponse.request);
    print(imageUriResponse.body);
    XmlDocument xmlDoc = XmlDocument.parse(imageUriResponse.body);
    Iterable<XmlElement> boardGames = xmlDoc.findAllElements('boardgame');;
    for (XmlElement game in boardGames) {
      // Get image element
      XmlElement? imageElement = game.findElements('image').firstOrNull;
      if (imageElement != null) {
        String? id = game.getAttribute('objectid');
        if (id != null) {
          String? imageUri = imageElement.innerText.trim();
          result[int.parse(id)]?.imageUri = imageUri;
        }
      }
    }
    return result.values.toList();
  }

  Future<GameDetailedInfo> getDetailedInfo(int id) async {
    http.Response response = await http.get(Uri.parse("${bgSearchUri}games/$id"));
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
    var unescape = HtmlUnescape();
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

  String getRequestBody(List<Filter> options) {
    List<Map<String, dynamic>> filterConditionList = [];
    for (var option in options) {
      filterConditionList.addAll(option.toJson());
    }
    return jsonEncode({
      "filterConditions": filterConditionList
    });
  }
}
