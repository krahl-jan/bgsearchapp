import 'package:bgsearchapp/3_presentation/options/age.dart';
import 'package:flutter/material.dart';

import '../options/name.dart';

class GameSearch extends StatefulWidget {
  const GameSearch({super.key});

  @override
  State<StatefulWidget> createState() => _GameSearchState();
}

class _GameSearchState extends State<GameSearch> {
  List<Widget> searchOptions = [const OptionWidgetAge(),const OptionWidgetName(), const IconButton(onPressed: null, icon:  Icon(Icons.add))];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          shrinkWrap: true,
          children: searchOptions,
        ),
      ),
    );
  }
}
