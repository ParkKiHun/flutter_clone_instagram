import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/message_popup.dart';
import 'package:go_router/go_router.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavViewModel extends ChangeNotifier {
  int _pageIndex = 0;
  List<int> bottomHistory = [0];

  int get pageIndex => _pageIndex;

  void changeBottomNav(int value, BuildContext context,
      {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.UPLOAD:
        context.pushNamed('upload');
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}) {
    _pageIndex = value;
    if (!hasGesture) return;
    if (bottomHistory.contains(value)) {
      bottomHistory.remove(value);
    }
    bottomHistory.add(value);
    print(bottomHistory);
    notifyListeners();
  }

  Future<bool> willPopAction(BuildContext context) async {
    if (bottomHistory.length == 1) {
      showDialog(
          context: context,
          builder: (context) => MessagePopup(
                message: '종료하시겠습니까?',
                okCallback: () {
                  exit(0);
                },
                cancleCallback: context.pop,
                title: '시스템',
              ));
      return true;
    } else {
      bottomHistory.removeLast();
      int index = bottomHistory.last;
      changeBottomNav(index, context, hasGesture: false);
      print(bottomHistory);
      return false;
    }
  }
}
