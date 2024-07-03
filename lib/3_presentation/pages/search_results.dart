import 'package:bgsearchapp/2_application/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'game_details.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
      ),
      body: ListView.builder(
        itemCount: map[page]!.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            onExpansionChanged: (bool isExpanded) {
              context.read<StateManager>().retrieveDetailedInfo(map[page]![index].id);
            },
            title: Row(
              children: [
                map[page]![index].imageUri.isNotEmpty
                    ? SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(
                          map[page]![index].imageUri,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ))
                    : const SizedBox(),
                Expanded(child: Text(map[page]![index].name))
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
                        if (favourites.contains(map[page]![index].id)) {
                          context
                              .read<StateManager>()
                              .removeFavourite(map[page]![index].id);
                        } else {
                          context
                              .read<StateManager>()
                              .addFavourite(map[page]![index].id);
                        }
                      },
                      color: favourites.contains(map[page]![index].id)
                          ? Colors.red
                          : Theme.of(context).disabledColor,
                      icon: const Icon(Icons.favorite)),
                ],
              ),
              GameDetails(gameId: map[page]![index].id),

            ],
          );
        },
      ),
    );
  }
}
