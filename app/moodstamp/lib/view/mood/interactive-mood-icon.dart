import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:moodstamp/common/clickable.dart';
import 'package:moodstamp/common/mood-icon.dart';

class InteractiveMoodIcon extends StatelessWidget {
  final MoodIcon moodIcon;
  final bool isActive;
  final void Function() onPressed;

  InteractiveMoodIcon(this.moodIcon, this.isActive, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Clickable(
          child: MoodIcon(
            moodIcon.icon,
            color: moodIcon.color,
            mood: moodIcon.mood,
            isActive: isActive,
          ),
          onPressed: onPressed,
        ),
        Text(
          isActive ? describeEnum(moodIcon.mood).toLowerCase() : '',
          style: TextStyle(
              fontSize: 17,
            color: moodIcon.color,
            decoration: TextDecoration.none,
              fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
