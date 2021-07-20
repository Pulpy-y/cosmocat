import 'package:cosmocat/components/rounded_button.dart';
import 'package:cosmocat/constant.dart';
import 'package:cosmocat/home/home_page.dart';
import 'package:cosmocat/size_config.dart';
import 'package:flutter/material.dart';

class Guide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: primaryColor,
        child: Column(
          children: [
            Container(
              height: SizeConfig.screenHeight! * 0.9,
              width: SizeConfig.screenWidth,
              child: Scrollbar(
                isAlwaysShown: true,
                thickness: 10,
                radius: Radius.circular(5),
                child: ListView(
                  padding: EdgeInsets.fromLTRB(50, 30, 50, 30),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      shadowColor: Colors.black,
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child:
                          Image(image: AssetImage("assets/image/guide1.png")),
                    ),
                    Card(
                      shadowColor: Colors.black,
                      elevation: 20,
                      child:
                          Image(image: AssetImage("assets/image/guide2.png")),
                    ),
                    Card(
                      shadowColor: Colors.black,
                      elevation: 20,
                      child:
                          Image(image: AssetImage("assets/image/guide3.png")),
                    ),
                    Card(
                      shadowColor: Colors.black,
                      elevation: 20,
                      child:
                          Image(image: AssetImage("assets/image/guide4.png")),
                    ),
                    Card(
                      shadowColor: Colors.black,
                      elevation: 20,
                      child:
                          Image(image: AssetImage("assets/image/guide5.png")),
                    ),
                  ],
                ),
              ),
            ),
            RoundedButton(
                text: "I got it!",
                press: () => Navigator.push(context, _createRoute()))
          ],
        ));
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
    );
  }
}
