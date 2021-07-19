import 'package:cosmocat/story/page4.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class Page3 extends StatelessWidget {
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
                image: new AssetImage("assets/image/story3.png"),
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
                            "Hmm... An elegant lazy cat!",
                            style: _textstyle,
                            //textAlign: TextAlign.center,
                          ))),
                  _divider,
                  DelayedDisplay(
                      delay: Duration(seconds: 3),
                      child: Container(
                          width: SizeConfig.screenWidth! * 0.9,
                          child: Text(
                            "Coma thought.",
                            style: _textstyle,

                            //textAlign: TextAlign.center,
                          ))),
                  _divider,
                  DelayedDisplay(
                      delay: Duration(seconds: 5),
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
      pageBuilder: (context, animation, secondaryAnimation) => Page4(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
