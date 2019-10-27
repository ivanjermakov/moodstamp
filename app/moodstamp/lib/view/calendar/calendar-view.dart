import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class CalendarView extends StatelessWidget {
  CalendarView();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Text('henlo calendar'),
      ),
    );
  }
}
