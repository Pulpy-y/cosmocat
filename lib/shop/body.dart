import 'package:cosmocat/backgroud.dart';
import 'package:cosmocat/constant.dart';
import 'package:cosmocat/shop/match.dart';
import 'package:cosmocat/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Body extends StatelessWidget {
  final double defaultSize = SizeConfig.defaultSize!;
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
            child: Match()),
      ],
    ));
  }
}
