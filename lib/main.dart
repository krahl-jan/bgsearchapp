import 'package:bgsearchapp/2_application/state_manager.dart';
import 'package:bgsearchapp/3_presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '1_domain/game_entity.dart';


Future<void> main() async {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) {
      initializeDatabase(context);
      return StateManager();
      },
    child: MaterialApp(
      title: 'BoardGame Search',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    ),
  ));
}

void initializeDatabase(BuildContext context) async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [GameShortInfoSchema],
    directory: dir.path,
  );
  // context.read<StateManager>().
}
