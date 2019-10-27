import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:moodstamp/view/calendar/calendar-view.dart';
import 'package:moodstamp/view/mood/mood-view.dart';
import 'package:moodstamp/view/more/more-view.dart';
import 'package:moodstamp/view/stats/stats-view.dart';

class App extends StatelessWidget {
  final List<Widget> views = [
    MoodView(),
    StatsView(),
    CalendarView(),
    MoreView()
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.mood)),
            BottomNavigationBarItem(icon: Icon(Icons.equalizer)),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today)),
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz)),
          ],
          backgroundColor: Colors.transparent,
          border: Border(),
          activeColor: Colors.black,
          inactiveColor: Color(0xFFBDBDBD),
        ),
        tabBuilder: (BuildContext context, int index) {
          return views[index];
        },
      ),
    );
  }
}
