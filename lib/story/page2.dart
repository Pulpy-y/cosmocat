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
                            style: _textstyle,
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
                      delay: Duration(seconds: 4),
                      child: Container(
                          width: SizeConfig.screenWidth! * 0.9,
                          child: Text(
                            "but he is still a lazy cat",
                            style: _textstyle,

                            //textAlign: TextAlign.center,
                          ))),
                  DelayedDisplay(
                      delay: Duration(seconds: 5),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Page2()));
                          },
                          icon: Container(
                              alignment: Alignment.bottomLeft,
                              width: SizeConfig.screenWidth! * 0.9,
                              child: Icon(Icons.arrow_right_alt_rounded,
                                  color: Colors.white, size: 30))))
                ],
              ))
        ]));
  }
}
