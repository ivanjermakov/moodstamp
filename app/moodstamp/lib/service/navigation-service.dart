import 'package:flutter/cupertino.dart';
import 'package:moodstamp/common/keys.dart';

class NavigationService {
    NavigationService();

    void changeActiveTab(int index) {
        (Keys.tabBarKey.currentWidget as CupertinoTabBar).onTap(index);
    }
}
