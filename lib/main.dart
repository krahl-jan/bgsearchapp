import 'package:bgsearchapp/3_presentation/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: 'BoardGame Search',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    ));
