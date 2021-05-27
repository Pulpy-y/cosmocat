import 'package:cosmocat/home/info.dart';
import 'package:cosmocat/time_setter/time_setter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cosmocat/size_config.dart';
import 'chart.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;

    return Column(
      children: <Widget>[
        Info(name: "Bitch", image: "assets/image/coma_as.png"),
        Chart(),
        OutlinedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => TimeSetter()));
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
    );
  }
}
