import 'package:flutter/material.dart';

import '../../2_application/options.dart';
import '../options/add_option.dart';
import '../options/option_widget.dart';

class GameSearch extends StatefulWidget {
  const GameSearch({super.key});

  @override
  State<StatefulWidget> createState() => _GameSearchState();
}

class _GameSearchState extends State<GameSearch> {
  List<Option> searchOptions = [OptionString(name: "Nameyname", order: 1), OptionInt(name: "Age", order: 2, value: 12)];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: null, child: const Icon(Icons.search),),
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
