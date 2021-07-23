import 'package:cosmocat/components/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


import '../constant.dart';
import '../database.dart';
import '../size_config.dart';

class PieChartSection extends StatefulWidget {

  @override
  _PieChartSectionState createState() => _PieChartSectionState();
}

class _PieChartSectionState extends State<PieChartSection> {
  late Map<String, double> data;
  bool loading = true;
  DateTime start = DateTime.now().subtract(Duration(days:6));
  DateTime end = DateTime.now().add(Duration(days:1));

  @override
  void initState() {
    setMap();
    super.initState();

  }

  Future<void> setMap() async {
    await DatabaseService().pieChartData(start, end).then(
            (output) {
          setState(() {
            data = output;
            loading = false;
          });
        });

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight! * 0.4,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(SizeConfig.defaultSize! * 1.8),
                child: Text("Pie Chart",
                  style: TextStyle(
                    color: themeSecondaryColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,),
                  textAlign: TextAlign.left,),
              ),
              Container(width: SizeConfig.screenWidth!*0.2),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(
                      255, 88, 141, 156), // background
                  onPrimary: Colors.white, // foreground
                ),
                  onPressed: () => _selectDateDialog(),
                  child: Text("Select date range")),
            ],
          ),
          loading
              ? Loading()
              : data.isEmpty
                ? Text("Select a range to see tag distribution",
                        style: TextStyle(color:Color.fromARGB(
                            255, 146, 201, 216) ),)
                : Container(
                    height: SizeConfig.screenHeight! *0.3,
                    child: PieChart(
                      legendOptions: LegendOptions(legendTextStyle: TextStyle(color: Colors.white)),
                      colorList: [
                        Color.fromARGB(255, 243, 179, 175),
                        Color.fromARGB(255, 146, 201, 215),
                        Color.fromARGB(255, 188, 220, 163),
                        Color.fromARGB(255, 139, 206, 206),
                        Color.fromARGB(255, 79, 180, 167),
                        Color.fromARGB(255, 238, 177, 116),
                        Color.fromARGB(255, 201, 175, 224),
                      ],

                      dataMap: data ,
              ),
            ),


        ],
      ),
    );
  }

  Future<void> _selectDateDialog() async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => Card(
          child: Column(
            children: [
              Container(
                child: SfDateRangePicker(
                  onSelectionChanged: _onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.range,
                  initialSelectedRange: PickerDateRange(
                      DateTime.now().subtract(const Duration(days: 4)),
                      DateTime.now().add(const Duration(days: 3))),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  child: Text("Ok"))
            ],
          )
            )
        );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        start = args.value.startDate;
        end = args.value.endDate ?? args.value.startDate;
      }
      setMap();
    });
  }
}

