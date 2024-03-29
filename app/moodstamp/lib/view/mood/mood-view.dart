import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:moodstamp/common/mood-icon.dart';
import 'package:moodstamp/model/mood-record.dart';
import 'package:moodstamp/model/mood.dart';
import 'package:moodstamp/view/mood/interactive-mood-icon.dart';
import 'package:moodstamp/view/mood/mood-description.dart';

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

    MoodRecord moodRecord;
    Timer realtimeClockTimer;

    void _pickDate() {
        realtimeClockTimer.cancel();
        showCupertinoModalPopup(
            context: context,
            builder: (BuildContext buildContext) =>
                Container(
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.dateAndTime,
                        use24hFormat: true,
                        initialDateTime: DateTime.now(),
                        onDateTimeChanged: (DateTime dt) => setState(() => moodRecord = moodRecord.withDateTime(dt)),
                    ),
                    height: MediaQuery
                        .of(context)
                        .copyWith()
                        .size
                        .height / 3,
                ),
        );
    }

    Future _pickMood(Mood mood) async {
        setState(() => moodRecord = moodRecord.withMood(mood));

        final description = await Navigator.of(context).push(
            CupertinoPageRoute(
                builder: (context) => ModelDescription(moodRecord),
            ),
        );

        print('description! $description');

        setState(() => moodRecord = moodRecord.withDescription(description));
    }

    @override
    void initState() {
        super.initState();

        moodRecord = MoodRecord.empty;
        realtimeClockTimer = Timer.periodic(
            Duration(seconds: 1),
                (Timer timer) => setState(() => moodRecord = moodRecord.withDateTime(DateTime.now())),
        );
    }

    @override
    Widget build(BuildContext context) {
        return CupertinoPageScaffold(
            child: Center(
                child: Column(
                    children: <Widget>[
                        Text(
                            "How are you?",
                            // TODO: global default text style (probably with custom Text widget)
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none,
                            ),
                            textAlign: TextAlign.center,
                        ),
                        GestureDetector(
                            child: Text(
                                "${DateFormat('yMMMMd').add_Hm().format(moodRecord.dateTime)}",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w300),
                            ),
                            onTap: _pickDate,
                        ),
                        Row(
                            children: moodIcons
                                .map((MoodIcon mi) =>
                                InteractiveMoodIcon(
                                    mi,
                                    mi.mood == moodRecord.mood,
                                        () => _pickMood(mi.mood),
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
            backgroundColor: Colors.white,
        );
    }

    @override
    void dispose() {
        realtimeClockTimer.cancel();
        super.dispose();
    }
}
