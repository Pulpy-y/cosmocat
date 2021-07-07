import 'package:cosmocat/components/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


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
    setMap().then((value) {
      setState(() {
        loading = false;
      });
    });
    super.initState();

  }

  Future<void> setMap() async {
    await DatabaseService().pieChartData(start, end).then(
            (output) {
          setState(() {
            data = output;
            print("data fetched-$start, $end");
            print(output);
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
                      fontSize: 22, //22
                      color: Colors.white),
                  textAlign: TextAlign.left,),
              ),
              ElevatedButton(
                  onPressed: () => _selectDateDialog(),
                  child: Text("Select date range")),
            ],
          ),
          loading
              ? Loading()
              : data.isEmpty
                ? Text("Select a range to see tag distribution")
                : Container(
                    height: SizeConfig.screenHeight! *0.3,
                    child: PieChart(
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
              ElevatedButton(onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              }, child: Text("Ok"))
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

