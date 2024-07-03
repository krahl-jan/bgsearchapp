import 'package:bgsearchapp/2_application/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
    var list = context.watch<StateManager>().searchResults;
    var favourites = context.watch<StateManager>().favourites;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Row(
              children: [
                list[index].imageUri.isNotEmpty
                    ? SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(
                          list[index].imageUri,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ))
                    : const SizedBox(),
                Expanded(child: Text(list[index].name))
              ],
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => _launchURL(
                          "https:/bgg.cc/boardgame/${list[index].id.toString()}"),
                      icon: const Icon(Icons.link)),
                  IconButton(
                      onPressed: () {
                        if (favourites.contains(list[index].id)) {
                          context
                              .read<StateManager>()
                              .removeFavourite(list[index].id);
                        } else {
                          context
                              .read<StateManager>()
                              .addFavourite(list[index].id);
                        }
                      },
                      color: favourites.contains(list[index].id)
                          ? Colors.red
                          : Colors.black,
                      icon: const Icon(Icons.favorite)),
                ],
              ),
              Text(context
                      .read<StateManager>()
                      .searchResultsDetails[list[index].id]
                      ?.description ??
                  "loading description ...")
            ],
          );
        },
      ),
    );
  }
}
