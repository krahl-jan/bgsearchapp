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
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ResultsPage()));
    }

    void saveFilters(BuildContext context) async {
      isar.writeTxn(() => isar.filterSets.put(toDbFilterSet(searchOptions)));
    }

    void loadFilters(BuildContext context) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => FilterSetSelection()));
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => doSearch(context),
        child: const Icon(Icons.search),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints.loose(Size.fromHeight(constraints.maxHeight * 0.9)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                height: 20,
                child: Row(children: [
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
                ]))
          ],
        ),
      ),
    );
  }
}
