import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Clickable extends StatelessWidget {
  final Widget child;
  final void Function() onPressed;

  Clickable({@required this.child, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: child,
      onPressed: onPressed,
      color: Colors.transparent,
      padding: EdgeInsets.all(0),
        pressedOpacity: 1,
    );
  }
}
