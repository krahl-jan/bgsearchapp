import 'package:bgsearchapp/2_application/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/game_details.dart';

class ResultsPageBody extends StatefulWidget {
  const ResultsPageBody({super.key});

  @override
  State<ResultsPageBody> createState() => _ResultsPageBodyState();
}

class _ResultsPageBodyState extends State<ResultsPageBody> {
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var page = context.watch<StateManager>().results_page;
    var map = context.watch<StateManager>().searchResultPages;
    var favourites = context.watch<StateManager>().favourites;
    if (map[page] == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
        itemCount: map[page]!.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            onExpansionChanged: (bool isExpanded) {
              context.read<StateManager>().retrieveDetailedInfo(map[page]![index].id!);
            },
            title: Row(
              children: [
                map[page]![index].imageUri!.isNotEmpty
                    ? SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(
                          map[page]![index].imageUri!,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ))
                    : const SizedBox(),
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(map[page]![index].name!),
                ))
              ],
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => _launchURL(
                          "https:/bgg.cc/boardgame/${map[page]![index].id.toString()}"),
                      icon: const Icon(Icons.link)),
                  IconButton(
                      onPressed: () {
                        if (favourites.contains(map[page]![index])) {
                          context
                              .read<StateManager>()
                              .removeFavourite(map[page]![index]);
                        } else {
                          context
                              .read<StateManager>()
                              .addFavourite(map[page]![index]);
                        }
                      },
                      color: favourites.contains(map[page]![index])
                          ? Colors.red
                          : Theme.of(context).disabledColor,
                      icon: const Icon(Icons.favorite)),
                ],
              ),
              GameDetails(gameId: map[page]![index].id!),

            ],
          );
        },
      );
  }
}
