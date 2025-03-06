import 'dart:async';
import 'dart:convert';

import 'package:bgsearch/1_domain/game_entity.dart';
import 'package:bgsearch/1_domain/repository_interface.dart';
import 'package:bgsearch/2_application/filters/filters.dart';
import 'package:http/http.dart' as http;

String bgSearchUri = "https://bgsearch.duckdns.org";
String shortInfoUri = "$bgSearchUri/boardgame/short";
String detailedInfoUri = "$bgSearchUri/boardgame";
String bggBaseUri = 'https://boardgamegeek.com/xmlapi/boardgame';

class HttpSearchRepository implements SearchRepository {
  int resultsPerPage = 10;

  Future<List<GameShortInfo>> getShortGameInfos(
      List<Filter> options, int page) async {
    String jsonBody = getRequestBody(options);
    print(jsonBody);

    http.Response response = await http.post(
        Uri.parse(
            "$shortInfoUri?pageNumber=$page&pageSize=$resultsPerPage&loadMetaDataIfMissing=true"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonBody);

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
    return result.values.toList();
  }

  Future<GameDetailedInfo> getDetailedInfo(int id) async {
    var jsonBody = jsonEncode({
      "filterConditions": [
        {"field": "BGG_ID", "operator": "EQUALS", "filterValue": id.toString()}
      ]
    });
    http.Response response = await http.post(
        Uri.parse("$detailedInfoUri?loadMetaDataIfMissing=true"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonBody);
    Map<String, dynamic> decoded = jsonDecode(utf8.decode(response.bodyBytes));
    return GameDetailedInfo.fromJson(decoded['boardGameItems'][0]);
  }

  String getRequestBody(List<Filter> options) {
    List<Map<String, dynamic>> filterConditionList = [];
    for (var option in options) {
      filterConditionList.addAll(option.toJson());
    }
    return jsonEncode({"filterConditions": filterConditionList});
  }
}
