import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import '../size_config.dart';

class Page4 extends StatefulWidget {
  Page4({Key? key}) : super(key: key);

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    //SizeConfig().init(context);
    TextStyle _textstyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22, //22
      color: Colors.white,
    );

    Future.delayed(Duration(seconds: 1), () {
      _visible = true;
      setState(() {});
    });

    SizedBox _divider = SizedBox(
      height: 10,
    );

    return Material(
        color: Colors.black,
        child: Stack(children: [
          Container(
              decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("assets/image/story3.png"),
                fit: BoxFit.cover),
          )),
          AnimatedOpacity(
            opacity: _visible ? 1 : 0,
            duration: Duration(seconds: 1),
            child: Container(
                decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new AssetImage("assets/image/shooting_star.png"),
                  fit: BoxFit.cover),
            )),
          ),
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
                            "A shooting star streaked across the sky.",
                            style: _textstyle,
                            //textAlign: TextAlign.center,
                          ))),
                  //_divider,
                  DelayedDisplay(
                      delay: Duration(seconds: 3),
                      child: Container(
                          width: SizeConfig.screenWidth! * 0.9,
                          child: Text(
                            "It was so bright, like a flash of lightning.",
                            style: _textstyle,

                            //textAlign: TextAlign.center,
                          ))),
                  _divider,
                  _divider,
                  _divider,
                  DelayedDisplay(
                      delay: Duration(seconds: 5),
                      child: Container(
                          width: SizeConfig.screenWidth! * 0.9,
                          child: Text(
                            " It lights up the sky, also lights up Coma’s heart.",
                            style: _textstyle.copyWith(color: Colors.indigo),
                            //textAlign: TextAlign.center,
                          ))),
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
