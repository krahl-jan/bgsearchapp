import 'package:bgsearchapp/2_application/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
    var favourites = context.watch<StateManager>().favourites;
    var detailedInfos = context.watch<StateManager>().searchResultsDetails;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: ListView.builder(
        itemCount: favourites.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Row(
              children: [
                detailedInfos[favourites[index]] != null && detailedInfos[favourites[index]]!.imageUri.isNotEmpty
                    ? SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.network(
                          detailedInfos[favourites[index]]!.imageUri,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ))
                    : const SizedBox(),
                Expanded(child: Text(detailedInfos[favourites[index]]!.name))
              ],
            ),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => _launchURL(
                          "https:/bgg.cc/boardgame/${detailedInfos[favourites[index]]!.id.toString()}"),
                      icon: const Icon(Icons.link)),
                  IconButton(
                      onPressed: () {
                        if (favourites.contains(detailedInfos[favourites[index]]!.id)) {
                          context
                              .read<StateManager>()
                              .removeFavourite(detailedInfos[favourites[index]]!.id);
                        } else {
                          context
                              .read<StateManager>()
                              .addFavourite(detailedInfos[favourites[index]]!.id);
                        }
                      },
                      color: favourites.contains(detailedInfos[favourites[index]]!.id)
                          ? Colors.red
                          : Colors.black,
                      icon: const Icon(Icons.favorite)),
                ],
              ),
              Text(context
                      .read<StateManager>()
                      .searchResultsDetails[detailedInfos[favourites[index]]!.id]
                      ?.description ??
                  "loading description ...")
            ],
          );
        },
      ),
    );
  }
}
