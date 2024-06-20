import 'package:bgsearchapp/2_application/state_manager.dart';
import 'package:bgsearchapp/3_presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() => runApp(ChangeNotifierProvider(
  create: (BuildContext context) => StateManager(),
  child: MaterialApp(
        title: 'BoardGame Search',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Home(),
      ),
));
