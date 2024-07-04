import 'package:bgsearchapp/2_application/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'game_details.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    context.watch<StateManager>().loadFavourites();



    var favourites = context.watch<StateManager>().favourites;

    return ListView.builder(
      itemCount: favourites.length,
      itemBuilder: (context, index) {
        return ExpansionTile(
          onExpansionChanged: (bool isExpanded) {
            context.read<StateManager>().retrieveDetailedInfo(favourites[index].id!);
          },
          title: Row(
            children: [
              favourites[index].imageUri!.isNotEmpty
                  ? SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.network(
                    favourites[index].imageUri!,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ))
                  : const SizedBox(),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(favourites[index].name!),
              ))
            ],
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () => _launchURL(
                        "https:/bgg.cc/boardgame/${favourites[index].id.toString()}"),
                    icon: const Icon(Icons.link)),
                IconButton(
                    onPressed: () {
                      if (favourites.contains(favourites[index])) {
                        context
                            .read<StateManager>()
                            .removeFavourite(favourites[index]);
                      } else {
                        context
                            .read<StateManager>()
                            .addFavourite(favourites[index]);
                      }
                    },
                    color: favourites.contains(favourites[index])
                        ? Colors.red
                        : Theme.of(context).disabledColor,
                    icon: const Icon(Icons.favorite)),
              ],
            ),
            GameDetails(gameId: favourites[index].id!),

          ],
        );
      },
    );
  }
}
