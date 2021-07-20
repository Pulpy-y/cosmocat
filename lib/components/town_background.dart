import 'package:flutter/material.dart';

class TownBackground extends StatelessWidget {
  final Widget child;
  const TownBackground({
    required this.child,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage("assets/image/town_background.png"), fit: BoxFit.cover,),
          ),
        ),
        new Center(
          child: child,
        )
      ],
    );
  }
}
