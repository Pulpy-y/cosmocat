import 'package:cosmocat/backgroud.dart';
import 'package:cosmocat/components/rounded_button.dart';
import 'package:cosmocat/constant.dart';
import 'package:cosmocat/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  double defaultSize = SizeConfig.defaultSize!;
  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(
      children: <Widget>[
        Container(height: defaultSize * 10),
        Text(
          "~ The friend matching store ~",
          style: TextStyle(color: Colors.white, fontSize: defaultSize * 2.5),
        ),
        Text(
          "~ 50 stars -> 1 match ~",
          style: TextStyle(color: Colors.white, fontSize: defaultSize * 2.5),
        ),
        Container(
            height: defaultSize * 60,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/shop.png"),
                    fit: BoxFit.fill)),
            child: Column(children: <Widget>[
              Container(),
              Padding(
                  padding: EdgeInsets.fromLTRB(defaultSize * 10,
                      defaultSize * 33, defaultSize * 10, defaultSize * 10),
                  child: TextButton(
                    child: Text("Match",
                        style: TextStyle(
                            color: Colors.white, fontSize: defaultSize * 3)),
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        primary: primaryColor,
                        backgroundColor: primaryColor,
                        shadowColor: Colors.yellow,
                        elevation: 10,
                        padding: EdgeInsets.fromLTRB(
                            defaultSize * 5,
                            defaultSize * 1.2,
                            defaultSize * 5,
                            defaultSize * 1.2),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(defaultSize * 3.6), //36
                            side: BorderSide(color: Colors.white))),
                  ))
            ])),

        //Image(image: AssetImage("assets/image/shop.png"))
      ],
    ));
  }
}
