import 'package:flutter/cupertino.dart';
import 'package:moodstamp/model/mood.dart';

class MoodIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Mood mood;
  final bool isActive;

  MoodIcon(this.icon, {@required this.color, @required this.mood, this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icon,
          color: isActive ? color : color.withAlpha(80),
          size: 60,
      ),
      padding: EdgeInsets.all(4),
    );
  }
}
