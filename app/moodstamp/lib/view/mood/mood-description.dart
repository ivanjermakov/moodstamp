import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moodstamp/common/clickable.dart';
import 'package:moodstamp/model/mood-record.dart';
import 'package:moodstamp/service/navigation-service.dart';

class MoodDescriptionRoute extends CupertinoPageRoute {
  MoodDescriptionRoute(MoodRecord moodRecord) : super(builder: (BuildContext context) => ModelDescription(moodRecord));
}

class ModelDescription extends StatefulWidget {
    final MoodRecord _moodRecord;

    ModelDescription(this._moodRecord);

    @override
    _ModelDescriptionState createState() => _ModelDescriptionState(_moodRecord);
}

class _ModelDescriptionState extends State<ModelDescription> {
    MoodRecord _moodRecord;

    _ModelDescriptionState(this._moodRecord);

    void _pickDescription(String description) {
        setState(() => _moodRecord = _moodRecord.withDescription(description));
    }

    void save() {
        print('saved: $_moodRecord');
        Navigator.of(context).pop();
        NavigationService.changeActiveTab(1);
    }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Colors.white,
        border: Border(),
        actionsForegroundColor: Colors.black,
        trailing: Clickable(
          child: Text(
            'Save',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
            onPressed: save,
        ),
      ),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
                "What made you feel ${describeEnum(_moodRecord.mood).toLowerCase()}?",
              // TODO: global default text style (probably with custom Text widget)
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                  fontWeight: FontWeight.w500,
                decoration: TextDecoration.none,
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              child: CupertinoTextField(
                placeholder: 'Note',
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border(),
                  color: Colors.black.withAlpha(10),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                cursorColor: Colors.black,
                  onChanged: (String description) => _pickDescription(description),
              ),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
          ],
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
