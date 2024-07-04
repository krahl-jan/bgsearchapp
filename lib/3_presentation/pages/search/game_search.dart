import 'package:bgsearchapp/1_domain/filter_set.dart';
import 'package:bgsearchapp/2_application/state_manager.dart';
import 'package:bgsearchapp/3_presentation/pages/search/filter_set_selection.dart';
import 'package:bgsearchapp/3_presentation/pages/search_results/search_results.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:provider/provider.dart';

import '../../../2_application/filters/filters.dart';
import '../../filters/filters.dart';
import '../../filters/filter_add.dart';

class GameSearch extends StatefulWidget {
  const GameSearch({super.key});

  @override
  State<StatefulWidget> createState() => _GameSearchState();
}

class _GameSearchState extends State<GameSearch> {
  @override
  Widget build(BuildContext context) {
    List<Filter> searchOptions = context.watch<StateManager>().searchOptions;
    Isar isar = context.read<StateManager>().isar;

    void doSearch(BuildContext context) {
      context.read<StateManager>().retrieveSearchResults(0);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ResultsPage()));
    }

    Future<String?> showTextFieldDialog(BuildContext context) async {
      TextEditingController _textFieldController = TextEditingController();
      bool inputInTextField = false;
      String? result = await showDialog<String>(
          context: context,
          builder: (context) => StatefulBuilder(
                builder: (context, setState) {
                  return AlertDialog(
                    title: const Text('Name your Filter'),
                    content: TextField(
                      controller: _textFieldController,
                      onChanged: (value) => setState(() {
                        inputInTextField = value.isNotEmpty;
                      }),
                      decoration: const InputDecoration(
                          hintText: "card games for four"),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        onPressed: inputInTextField
                            ? () => Navigator.of(context)
                                .pop(_textFieldController.text)
                            : null,
                        child: const Text('OK'),
                      ),
                    ],
                  );
                },
              ));
      return result;
    }

    void saveFilters(BuildContext context) async {
      String? enteredText = await showTextFieldDialog(context);
      if (enteredText != null && enteredText.isNotEmpty) {
        isar
            .writeTxn(() =>
                isar.filterSets.put(toDbFilterSet(enteredText, searchOptions)))
            .whenComplete(
                () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Center(child: Text("filter saved")),
                      duration: Duration(milliseconds: 500),
                      width: 200,
                    )));
      }
    }

    void loadFilters(BuildContext context) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const FilterSetSelection()));
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => doSearch(context),
        child: const Icon(Icons.search),
      ),
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: [
              ConstrainedBox(
                constraints: BoxConstraints.loose(
                    Size.fromHeight(constraints.maxHeight * 0.9)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: searchOptions.length,
                    itemBuilder: (context, i) {
                      return OptionWidgetImp(option: searchOptions[i]);
                    },
                  ),
                ),
              ),
              const OptionWidgetAddOption(),
              SizedBox(
                  height: 30,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(children: [
                      FilledButton(
                        onPressed: () => saveFilters(context),
                        child: const Text("save"),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      FilledButton(
                        onPressed: () => loadFilters(context),
                        child: const Text("load"),
                      ),
                    ]),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
