import 'package:cosmocat/components/loading.dart';
import 'package:cosmocat/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heatmap_calendar/heatmap_calendar.dart';

import '../size_config.dart';

class HeatMap extends StatefulWidget {

  @override
  _HeatMapState createState() => _HeatMapState();
}

class _HeatMapState extends State<HeatMap> {
  late Map<DateTime, int> mapInput;
  bool loading = true;

  @override
  void initState() {
    setMap().then((value) {
      setState(() {
        loading = false;
      });
    });
    super.initState();

  }

  Future<void> setMap() async {
    await DatabaseService().heatMapData().then(
            (input) {
              setState(() {
                mapInput = input;
              });
            });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight! * 0.42,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(SizeConfig.defaultSize! * 1.8),
            child: Text("Heatmap Calendar",
              style: TextStyle(
                  fontSize: 22, //22
                  color: Colors.white),
              textAlign: TextAlign.left,),
          ),
          loading? Loading():HeatMapCalendar(
            input: mapInput,
            colorThresholds: {
              1: Colors.green[100]!,
              10:Colors.green[300]!,
              30:Colors.green[500]!
            },
            weekDaysLabels: ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
            monthsLabels: [
              "",
              "Jan",
              "Feb",
              "Mar",
              "Apr",
              "May",
              "Jun",
              "Jul",
              "Aug",
              "Sep",
              "Oct",
              "Nov",
              "Dec",
            ],
            squareSize: 20.0,
            textOpacity: 0.3,
            labelTextColor: Colors.blueGrey,
            dayTextColor: Colors.blue[500],

          )
        ],

      ),
    );
  }
}
