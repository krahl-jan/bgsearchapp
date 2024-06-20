import 'package:flutter/material.dart';

class StateManager extends ChangeNotifier {
  int pageIndex = 0;

  setPageIndex(int i) {
    pageIndex = i;
    notifyListeners();
  }
}