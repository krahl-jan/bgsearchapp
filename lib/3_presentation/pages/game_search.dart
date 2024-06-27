import 'package:bgsearchapp/2_application/state_manager.dart';
import 'package:bgsearchapp/3_presentation/pages/search_results.dart';
import 'package:flutter/material.dart';
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

    void doSearch(BuildContext context) {
      context.read<StateManager>().retrieveSearchResults();
      Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage()));
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () => doSearch(context), child: const Icon(Icons.search),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[for (var o in searchOptions) OptionWidgetImp(option: o)] + [const OptionWidgetAddOption()],
        ),
      ),
    );
  }
}
