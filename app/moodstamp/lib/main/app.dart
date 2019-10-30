import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moodstamp/common/keys.dart';
import 'package:moodstamp/view/calendar/calendar-view.dart';
import 'package:moodstamp/view/mood/mood-view.dart';
import 'package:moodstamp/view/more/more-view.dart';
import 'package:moodstamp/view/stats/stats-view.dart';

class App extends StatefulWidget {
    @override
    _AppState createState() => _AppState();
}

class _AppState extends State<App> {
    int _currentIndex = 0;
    final List<Widget> views = [MoodView(), StatsView(), CalendarView(), MoreView()];

    void setActiveTab(int index) {
        print('setting active tab');
        setState(() => _currentIndex = index);
    }

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            home: CupertinoTabScaffold(
                tabBar: CupertinoTabBar(
                    key: Keys.tabBarKey,
                    onTap: (int index) => setActiveTab(index),
                    currentIndex: _currentIndex,
                    items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.smile)),
                        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.chartBar)),
                        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.calendar)),
                        BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.ellipsisH)),
                    ],
                    backgroundColor: Colors.transparent,
                    border: Border(),
                    activeColor: Colors.black,
                    inactiveColor: Color(0xFFBDBDBD),
                ),
                tabBuilder: (BuildContext context, int index) {
                    _resetMoodView(views[0] as MoodView);
                    return views[index];
                },
            ),
            theme: ThemeData(fontFamily: 'Raleway'),
        );
    }

    void _resetMoodView(MoodView view) {}
}
