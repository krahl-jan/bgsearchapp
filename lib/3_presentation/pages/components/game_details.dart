import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../2_application/state_manager.dart';

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
    var info = list[widget.gameId];
    if (info == null) {
      return const CircularProgressIndicator();
    }
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Wrap(
            spacing: 8.0, // Horizontal space between buttons
            runSpacing: 8.0, // Vertical space between lines
            alignment: WrapAlignment.center,
            children: [
              Tooltip(
                message: "The rating of this game as voted by ${info.ratingVotes} players",
                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Theme.of(context).highlightColor), child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${info.rating.toStringAsFixed(2)} Rating"),
                )),
              ),
              Tooltip(
                message: "The minimum and maximum playtime for this game",
                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Theme.of(context).highlightColor), child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${info.minPlaytime.toString()} - ${info.maxPlaytime.toString()} Minutes"),
                )),
              ),
              Tooltip(
                message: "The minimum and maximum player count for this game",
                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Theme.of(context).highlightColor), child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${info.minPlayers} - ${info.maxPlayers} Players"),
                )),
              ),
              Tooltip(
                message: "The complexity of the game as rated by ${info.weightVotes} players",
                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Theme.of(context).highlightColor), child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${info.weight.toStringAsFixed(2)} Weight"),
                )),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Tooltip(
              message: "Game Description",
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Theme.of(context).highlightColor),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ExpandableText(
                      onExpandedChanged: (bool isExpanded) {
                        if (!isExpanded) {
                          Scrollable.ensureVisible(context, duration: const Duration(milliseconds: 300));
                        }
                      },
                      collapseOnTextTap: true,
                      info.description,
                      expandText: 'show more',
                      collapseText: 'show less',
                      maxLines: 4,
                      linkColor: Colors.blue,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}