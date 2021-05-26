import 'package:cosmocat/home/info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cosmocat/constant.dart';
import '../size_config.dart';
import 'chart.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Info(name: "Bitch", image: "assets/image/coma_as.png"),
        Chart(),
      ],
    );
  }
}
