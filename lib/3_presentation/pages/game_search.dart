import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../options/name.dart';

class GameSearch extends StatefulWidget {
  const GameSearch({super.key});

  @override
  State<StatefulWidget> createState() => _GameSearchState();
}

class _GameSearchState extends State<GameSearch> {
  List<Widget> searchOptions = [const OptionWidgetName(), const IconButton(onPressed: null, icon:  Icon(Icons.add))];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: searchOptions,
      ),
    );
  }
}
