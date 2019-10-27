import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoodView extends StatelessWidget {
  MoodView();

  @override
  Widget build(BuildContext context) {
    DateTime _dateTime = DateTime.now();

    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              "How are you?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            CupertinoButton(
              child: Text(
                "${DateFormat.yMMMMEEEEd().add_Hm().format(_dateTime)}",
                style: TextStyle(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              ),
              onPressed: () => showCupertinoModalPopup(
                context: context,
                builder: (BuildContext buildContext) => Container(
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.dateAndTime,
                    initialDateTime: DateTime.now(),
                    onDateTimeChanged: (DateTime dt) => _dateTime = dt,
                  ),
                  height: MediaQuery.of(context).copyWith().size.height / 3,
                ),
              ),
              color: Colors.transparent,
            ),
          ],
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
