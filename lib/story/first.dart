import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle _textstyle = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22, //22
        color: Colors.white);
    return Column(
      children: [
        DelayedDisplay(
            delay: Duration(seconds: 2),
            child: Text("This is Coma, an ordinary cat")),
        DelayedDisplay(
            delay: Duration(seconds: 2),
            child: Text(
              "This is Coma, an ordinary cat",
              style: _textstyle,
            ))
      ],
    );
  }
}
