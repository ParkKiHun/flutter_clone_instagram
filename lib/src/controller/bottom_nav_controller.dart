import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends ChangeNotifier {
  int _pageIndex = 0;

  int get pageIndex => _pageIndex;

  void changeBottomNav(int value, BuildContext context) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.UPLOAD:
        context.pushNamed('upload');
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value);
        break;
    }
  }

  void _changePage(int value) {
    _pageIndex = value;
    notifyListeners();
  }
}
