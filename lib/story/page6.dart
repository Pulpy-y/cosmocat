import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class Page6 extends StatefulWidget {
  Page6({Key? key}) : super(key: key);

  @override
  _Page6State createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    TextStyle _textstyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22, //22
      color: Colors.white,
    );

    Future.delayed(Duration(seconds: 7), () {
      _visible = true;
      setState(() {});
    });

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
          AnimatedOpacity(
            opacity: _visible ? 1 : 0,
            duration: Duration(seconds: 1),
            child: Container(
                decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage("assets/image/story6.png"),
                  fit: BoxFit.cover),
            )),
          ),
          Container(
              padding: EdgeInsets.all(20),
              height: SizeConfig.screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: h * 0.45,
                  ),
                  DelayedDisplay(
                      delay: Duration(seconds: 1),
                      child: Container(
                          width: SizeConfig.screenWidth! * 0.9,
                          child: Text(
                            "He sees shining stars align into shape.",
                            style: _textstyle,
                            //textAlign: TextAlign.center,
                          ))),
                  _divider,
                  DelayedDisplay(
                      delay: Duration(seconds: 3),
                      child: Container(
                          width: SizeConfig.screenWidth! * 0.9,
                          child: Text(
                            "He sees spiky stars blinking in the Milky Way. ",
                            style: _textstyle,
                            //textAlign: TextAlign.center,
                          ))),
                  _divider,
                  DelayedDisplay(
                      delay: Duration(seconds: 5),
                      child: Container(
                          width: SizeConfig.screenWidth! * 0.9,
                          child: Text(
                            "He sees…",
                            style: _textstyle,
                            //textAlign: TextAlign.center,
                          ))),
                  _divider,
                  DelayedDisplay(
                      delay: Duration(seconds: 7),
                      child: Container(
                          width: SizeConfig.screenWidth! * 0.9,
                          child: Text(
                            "he sees ANIMALS FLOATING ON THE SKY???",
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
