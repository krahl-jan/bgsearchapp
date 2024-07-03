import 'package:bgsearchapp/1_domain/filter_set.dart';
import 'package:bgsearchapp/2_application/state_manager.dart';
import 'package:bgsearchapp/3_presentation/pages/filter_set_selection.dart';
import 'package:bgsearchapp/3_presentation/pages/search_results.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

import '../../2_application/options/options.dart';
import '../options/option.dart';
import '../options/option_add.dart';

class GameSearch extends StatefulWidget {
  const GameSearch({super.key});

  @override
  State<StatefulWidget> createState() => _GameSearchState();
}

class _GameSearchState extends State<GameSearch> {

  @override
  Widget build(BuildContext context) {
    List<Option> searchOptions = context.watch<StateManager>().searchOptions;
    Isar isar = context.read<StateManager>().isar;

    void doSearch(BuildContext context) {
      context.read<StateManager>().retrieveSearchResults();
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ResultsPage()));
    }

    Future<String?> showTextFieldDialog(BuildContext context) async {
      TextEditingController _textFieldController = TextEditingController();
      String? result = await showDialog<String>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Enter Text'),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Type something"),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop(_textFieldController.text);
                },
              ),
            ],
          );
        },
      );
      return result;
    }

    void saveFilters(BuildContext context) async {
      String? enteredText = await showTextFieldDialog(context);
      if (enteredText != null && enteredText.isNotEmpty) {
        isar.writeTxn(() => isar.filterSets.put(toDbFilterSet(enteredText ,searchOptions)));
      }

    }

    void loadFilters(BuildContext context) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const FilterSetSelection()));
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () => doSearch(context), child: const Icon(Icons.search),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[for (var o in searchOptions) OptionWidgetImp(option: o)] + [const OptionWidgetAddOption()],
            ),
          ),
          SizedBox(
            height: 20,
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => saveFilters(context),
                  child: const Text("save"),
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                  onPressed: () => loadFilters(context),
                  child: const Text("load"),
                ),
              ]
            )
          )
        ],
      ),
    );
  }
}
