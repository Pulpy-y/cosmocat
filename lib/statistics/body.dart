import 'package:cosmocat/components/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';
import 'heatmap.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              //color: Colors.lightBlue,
              height: AppBar().preferredSize.height,
            ),
            HeatMap(),//heatmap
            Container(
              height: SizeConfig.screenHeight! * 0.05,
              color: Colors.yellow,
            ), //space
            Container(
              height: SizeConfig.screenHeight! * 0.4,
              color: Colors.red,
            ),//pie chart
          ],
        ),
      ),
    );
  }
}
