import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:moodstamp/common/clickable.dart';
import 'package:moodstamp/common/mood-icon.dart';
import 'package:moodstamp/model/mood.dart';
import 'package:moodstamp/view/mood/interactive-mood-icon.dart';

class MoodView extends StatefulWidget {
  MoodView();

  @override
  _MoodViewState createState() => _MoodViewState();
}

class _MoodViewState extends State<MoodView> {
    final List<MoodIcon> moodIcons = [
        MoodIcon(
            FontAwesomeIcons.solidGrin,
            color: Color(0xFF6BEB03),
            mood: Mood.HAPPY,
        ),
        MoodIcon(
            FontAwesomeIcons.solidSmile,
            color: Color(0xFFB4EB00),
            mood: Mood.GOOD,
        ),
        MoodIcon(
            FontAwesomeIcons.solidMeh,
            color: Color(0xFFEBD600),
            mood: Mood.OK,
        ),
        MoodIcon(
            FontAwesomeIcons.solidFrown,
            color: Color(0xFFEBB100),
            mood: Mood.BAD,
        ),
        MoodIcon(
            FontAwesomeIcons.solidSadTear,
            color: Color(0xFFEB8100),
            mood: Mood.HORRIBLE,
        ),
    ];

    DateTime _dateTime = DateTime.now();
    Mood _mood;

    void _pickDate() {
        showCupertinoModalPopup(
            context: context,
            builder: (BuildContext buildContext) =>
                Container(
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.dateAndTime,
                        use24hFormat: true,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (DateTime dt) => setState(() => _dateTime = dt),
                    ),
                    height: MediaQuery
                        .of(context)
                        .copyWith()
                        .size
                        .height / 3,
                ),
        );
    }

    void _pickMood() {}

    @override
    Widget build(BuildContext context) {
        return CupertinoPageScaffold(
            child: Center(
                child: Column(
                    children: <Widget>[
                        Text(
                            "How are you?",
//            TODO: global default text style (probably with custom Text widget)
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
                        ),
                        Clickable(
                            child: Text(
                                "${DateFormat('yMMMMd').add_Hm().format(_dateTime)}",
                                style: TextStyle(
                                    color: Colors.black,
                                    decoration: TextDecoration.underline,
                                ),
                            ),
                            onPressed: _pickDate,
                        ),
                        Row(
                            children: moodIcons
                                .map((MoodIcon mi) =>
                                InteractiveMoodIcon(
                                    mi,
                                    mi.mood == _mood,
                                        () => setState(() => mi.mood == _mood ? _mood = null : _mood = mi.mood),
                                ))
                                .toList(),
                            mainAxisAlignment: MainAxisAlignment.center,
                        )
                    ],
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                ),
            ),
        );
    }
}
