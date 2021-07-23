import 'package:cosmocat/components/loading.dart';
import 'package:cosmocat/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heatmap_calendar/heatmap_calendar.dart';

import '../constant.dart';
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
    loading = true;
    setMap();
    super.initState();

  }

  Future<void> setMap() async {
    await DatabaseService().heatMapData().then(
            (input) {
              setState(() {
                mapInput = input;
                loading = false;
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
                color: themeSecondaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,),
              textAlign: TextAlign.left,),
          ),
          loading? Loading():HeatMapCalendar(
            input: mapInput,
            colorThresholds: {
              1: Color.fromARGB(255, 170, 212, 192),
              10:Color.fromARGB(255, 72, 174, 157),
              30:Color.fromARGB(255, 3, 135, 134)
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
