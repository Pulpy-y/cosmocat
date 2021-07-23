import 'package:cosmocat/components/background.dart';
import 'package:cosmocat/statistics/chart.dart';
import 'package:cosmocat/statistics/pie_chart_section.dart';
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
              height: AppBar().preferredSize.height * 1.5,
            ),
            Chart(),
            HeatMap(),//heatmap
            Container(
              height: SizeConfig.screenHeight! * 0.01,
            ), //space
            PieChartSection(),
           //pie chart
          ],
        ),
      ),
    );
  }
}
