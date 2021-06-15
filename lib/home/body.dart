import 'package:cosmocat/home/info.dart';
import 'package:cosmocat/home/sidebar.dart';
import 'package:cosmocat/time_setter/time_setter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cosmocat/size_config.dart';
import '../backgroud.dart';
import 'chart.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;

    return Background(
        child: Padding(
            padding: EdgeInsets.only(top: defaultSize * 5),
            child: Column(
              children: <Widget>[
                Stack(children: <Widget>[
                  Info(name: "Username", image: "assets/image/coma_as.png"),
                  Positioned(child: SideBar(), right: 0, top: defaultSize * 2)
                ]),
                Chart(),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => TimeSetter()));
                  },
                  child: Padding(
                      padding: EdgeInsets.all(defaultSize * 1.6),
                      child: Text("Start Timer")),
                  style: OutlinedButton.styleFrom(
                      textStyle: TextStyle(
                    fontSize: defaultSize * 2.2,
                  )),
                )
              ],
            )));
  }
}
