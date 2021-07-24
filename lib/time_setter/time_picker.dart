import 'package:cosmocat/constant.dart';
import 'package:cosmocat/time_setter/page_variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../size_config.dart';

class TimePicker extends StatefulWidget {
  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  double defaultSize = SizeConfig.defaultSize!;
  List tags = [];
  bool allowPress = true;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: defaultSize, horizontal: defaultSize * 1.6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    child: Text(
                      "Focus Duration",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: defaultSize * 2.2, //22
                          color: Colors.white),
                      textAlign: TextAlign.left,
                    ),
                    margin: EdgeInsets.all(defaultSize * 1.8) // 18
                    ),
                Card(
                    // input time
                    color: themeSecondaryColor,
                    child: Padding(
                        padding: EdgeInsets.all(defaultSize * 1.6), //16
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: defaultSize * 15,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ], //only numbers can be entered
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Hours',
                                    fillColor: Colors.white),
                                onChanged: (value) {
                                  if (value == "") hour = 0;
                                  hour = int.parse(value.trim());
                                },
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.all(defaultSize * 1.8),
                                child: Text(
                                  ":",
                                  style: TextStyle(fontSize: defaultSize * 2),
                                )),
                            Container(
                              width: defaultSize * 15,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ], //only numbers can be entered
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Minutes',
                                    fillColor: Colors.white),
                                onChanged: (value) {
                                  if (value == "") minute = 0;
                                  minute = int.parse(value.trim());
                                },
                              ),
                            ),
                          ],
                        ))),
              ]),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
