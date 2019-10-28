import 'package:flutter/cupertino.dart';
import 'package:moodstamp/common/keys.dart';

class NavigationService {
  static void changeActiveTab(int index) {
    (Keys.tabBarKey.currentWidget as CupertinoTabBar).onTap(index);
  }
}
