import 'package:cosmocat/story/page6.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    TextStyle _textstyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22, //22
      color: Colors.white,
    );

    SizedBox _divider = SizedBox(
      height: 10,
    );

    double h = SizeConfig.screenHeight!;
    return Material(
        color: Colors.black,
        child: Stack(children: [
          Container(
              decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("assets/image/story5.png"),
                fit: BoxFit.cover),
          )),
          Container(
              padding: EdgeInsets.all(20),
              height: SizeConfig.screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DelayedDisplay(
                      delay: Duration(seconds: 1),
                      child: Container(
                          width: SizeConfig.screenWidth! * 0.9,
                          child: Text(
                            "“What is that…”",
                            style: _textstyle,
                            //textAlign: TextAlign.center,
                          ))),
                  _divider,
                  DelayedDisplay(
                      delay: Duration(seconds: 3),
                      child: Container(
                          width: SizeConfig.screenWidth! * 0.9,
                          child: Text(
                            "Coma holds his breath. ",
                            style: _textstyle,
                            //textAlign: TextAlign.center,
                          ))),
                  _divider,
                  DelayedDisplay(
                      delay: Duration(seconds: 5),
                      child: Container(
                          width: SizeConfig.screenWidth! * 0.9,
                          child: Text(
                            " He sits up and looks into the sky.",
                            style: _textstyle,
                            //textAlign: TextAlign.center,
                          ))),
                  _divider,
                  DelayedDisplay(
                      delay: Duration(seconds: 7),
                      child: Container(
                          width: SizeConfig.screenWidth! * 0.9,
                          child: Text(
                            "The sky suddenly turns differently in his eyes...",
                            style: _textstyle,
                            //textAlign: TextAlign.center,
                          ))),
                  _divider,
                  DelayedDisplay(
                      delay: Duration(seconds: 7),
                      child: Container(
                          alignment: Alignment.bottomLeft,
                          width: SizeConfig.screenWidth! * 0.9,
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(context, _createRoute());
                              },
                              icon: Icon(Icons.arrow_right_alt_rounded,
                                  color: Colors.grey, size: 30))))
                ],
              ))
        ]));
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Page6(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
