
import 'package:flutter/material.dart';

class BottomNavigationViewModel extends ChangeNotifier {
  int _index = 0;

  int get currentNavigationIndex => _index;

  updatePage(int index) {
    _index = index;
    notifyListeners();
  }
}
