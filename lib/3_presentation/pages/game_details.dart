import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../2_application/state_manager.dart';

class GameDetails extends StatefulWidget {
  final int gameId;
  const GameDetails({super.key, required this.gameId});

  @override
  GameDetailsState createState() => GameDetailsState();
}

class GameDetailsState extends State<GameDetails> {

  @override
  Widget build(BuildContext context) {
    var list = context.watch<StateManager>().searchResultsDetails;
    if (list[widget.gameId] == null) {
      return const CircularProgressIndicator();
    }
    return Text(list[widget.gameId]?.description ?? "no description");
  }
}