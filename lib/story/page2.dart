import 'package:cosmocat/story/page3.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    TextStyle _textstyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20, //22
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
                image: new AssetImage("assets/image/story1.png"),
                fit: BoxFit.cover),
          )),
          Container(
              padding: EdgeInsets.all(20),
              height: SizeConfig.screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: h * 0.15,
                  ),
                  Container(
                      child: Image(
                          image: AssetImage("assets/image/coma_lie.png"))),
                  DelayedDisplay(
                      delay: Duration(seconds: 1),
                      child: Container(
                          width: SizeConfig.screenWidth! * 0.9,
                          child: Text(
                            "He never finds anything interesting.",
                            style: _textstyle.copyWith(color: Colors.indigo),
                            //textAlign: TextAlign.center,
                          ))),
                  _divider,
                  DelayedDisplay(
                      delay: Duration(seconds: 3),
                      child: Container(
                          width: SizeConfig.screenWidth! * 0.9,
                          child: Text(
                            "Maybe his favorite fish snack could move him a little",
                            style: _textstyle,

                            //textAlign: TextAlign.center,
                          ))),
                  _divider,
                  DelayedDisplay(
                      delay: Duration(seconds: 5),
                      child: Row(
                        children: [
                          Text(
                            "but he is still a lazy cat",
                            style: _textstyle,
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.push(context, _createRoute());
                              },
                              icon: Container(
                                  alignment: Alignment.bottomLeft,
                                  width: SizeConfig.screenWidth! * 0.9,
                                  child: Icon(Icons.arrow_right_alt_rounded,
                                      color: Colors.white, size: 30)))
                        ],
                      )),
                ],
              ))
        ]));
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Page3(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
