import 'package:bgsearchapp/2_application/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultsPage extends StatefulWidget {
  ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  final List<String> imageLinks = [
    'https://via.placeholder.com/150',
    'https://via.placeholder.com/200',
    'https://via.placeholder.com/250'
  ];

  final List<String> titles = ['Title 1', 'Title 2', 'Title 3'];

  final List<String> webLinks = [
    'https://www.example.com/1',
    'https://www.example.com/2',
    'https://www.example.com/3'
  ];

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Card(
              margin: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading:
                          list[index].imageUri.isNotEmpty ? SizedBox(
                              height: 200,
                              width: 100,
                              child: Image.network(list[index].imageUri, fit: BoxFit.cover, alignment: Alignment.topCenter,)) : const SizedBox(),
                      title: Text(list[index].name),
                    ),
                  ),
                ],
              ),
            ),
            children: [IconButton(
              onPressed: () => _launchURL(
              "https:/bgg.cc/boardgame/${list[index].id.toString()}"),
          icon: const Icon(Icons.link)), // icon-1,
          Text(context.read<StateManager>().searchResultsDetails[list[index].id]?.description ?? "loading description ...")],
          );
        },
      ),
    );
  }
}
