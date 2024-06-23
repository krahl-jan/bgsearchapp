import 'package:bgsearchapp/2_application/state_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../2_application/options.dart';
import '../options/add_option.dart';
import '../options/option_widget.dart';

class GameSearch extends StatefulWidget {
  const GameSearch({super.key});

  @override
  State<StatefulWidget> createState() => _GameSearchState();
}

class _GameSearchState extends State<GameSearch> {

  doSearch() async {
    var infos = await context.read<StateManager>().repository.getShortGameInfos(context.read<StateManager>().searchOptions);
    for (var info in infos) {
      print(info.name);
    }
  }
  

  @override
  Widget build(BuildContext context) {
    List<Option> searchOptions = context.watch<StateManager>().searchOptions;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: doSearch, child: const Icon(Icons.search),),
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
