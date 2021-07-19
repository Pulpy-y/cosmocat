import 'package:cosmocat/components/background.dart';
import 'package:cosmocat/size_config.dart';
import 'package:cosmocat/story/second.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TextStyle _textstyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22, //22
      color: Colors.white,
    );
    Future.delayed(Duration(seconds: 1), () {
      _visible = true;
      setState(() {});
    });
    return Material(
        color: Colors.black,
        child: Stack(children: [
          AnimatedOpacity(
              opacity: _visible ? 1 : 0,
              duration: Duration(seconds: 5),
              child: new Container(
                  decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("assets/image/story1.png"),
                    fit: BoxFit.cover),
              ))),
          Container(
              padding: EdgeInsets.all(20),
              height: SizeConfig.screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.2,
                  ),
                  DelayedDisplay(
                      delay: Duration(seconds: 1),
                      child: Text(
                        "This is Coma, an ordinary cat...",
                        style: _textstyle,
                        textAlign: TextAlign.center,
                      )),
                  DelayedDisplay(
                      delay: Duration(seconds: 2),
                      child: Image(
                          image: AssetImage("assets/image/coma_lie.png"))),
                  DelayedDisplay(
                      delay: Duration(seconds: 4),
                      child: Text(
                        "who likes to just lie on the ground from day to night...",
                        style: _textstyle,
                        textAlign: TextAlign.center,
                      )),
                  DelayedDisplay(
                      delay: Duration(seconds: 6),
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(context, _createRoute());
                          },
                          icon: Icon(Icons.arrow_right_alt_rounded,
                              color: Colors.white, size: 30)))
                ],
              ))
        ]));
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Second(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
