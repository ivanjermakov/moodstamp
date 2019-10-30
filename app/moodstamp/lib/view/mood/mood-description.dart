import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moodstamp/model/mood-record.dart';
import 'package:moodstamp/service/navigation-service.dart';

class ModelDescription extends StatefulWidget {
    final MoodRecord _moodRecord;

    ModelDescription(this._moodRecord);

    @override
    _ModelDescriptionState createState() => _ModelDescriptionState(_moodRecord);
}

class _ModelDescriptionState extends State<ModelDescription> {
    final NavigationService _navigationService = NavigationService();
    MoodRecord _moodRecord;

    _ModelDescriptionState(this._moodRecord);

    void _pickDescription(String description) {
        setState(() => _moodRecord = _moodRecord.withDescription(description));
    }

    void pop() {
        print(_moodRecord.description);
        Navigator.of(context).pop(_moodRecord.description);
    }

    void save() {
        print('saved: $_moodRecord');
        pop();
        _navigationService.changeActiveTab(1);
    }

    @override
    Widget build(BuildContext context) {
        return
//            WillPopScope(
//            child:
            CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                    backgroundColor: Colors.white,
                    border: Border(),
                    actionsForegroundColor: Colors.black,
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
                                child: Stack(
                                    alignment: Alignment.bottomRight,
                                    children: [
                                        CupertinoTextField(
                                            placeholder: 'Optional',
                                            padding: EdgeInsets.fromLTRB(10, 10, 34, 10),
                                            cursorColor: Colors.black,
                                            onChanged: (String description) => _pickDescription(description),
                                            decoration: BoxDecoration(
                                                border: Border()
                                            ),
                                            minLines: 1,
                                            maxLines: 10,
                                            scrollController: ScrollController(
                                            ),
                                            scrollPhysics: ScrollPhysics(),
                                        ),
                                        GestureDetector(
                                            child: Container(
                                                child: Icon(
                                                    FontAwesomeIcons.check,
                                                    color: Colors.black,
                                                ),
                                                decoration: BoxDecoration(
//                                                color: Colors.black,
//                                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                                ),
                                                padding: EdgeInsets.all(8),
                                            ),
                                            onTap: save,
                                        ),
                                    ],
                                ),
                                decoration: BoxDecoration(
                                    border: Border(),
                                    color: Colors.black.withAlpha(10),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                    ),
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
//            ),
//            onWillPop: () async {
//                return Future(() {
//                    pop();
//                    return true;
//                });
//            },
            );
    }
}
