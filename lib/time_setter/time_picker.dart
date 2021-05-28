import 'package:cosmocat/constant.dart';
import 'package:cosmocat/count_down/count_down_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../size_config.dart';

class TimePicker extends StatefulWidget {
  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  double defaultSize = SizeConfig.defaultSize!;
  int hour = 0;
  int minute = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            child: Text(
          "Pick a time",
          style: TextStyle(
            fontSize: defaultSize * 2.2, // 22
          ),
          textAlign: TextAlign.left,
        )
            //margin: EdgeInsets.all(defaultSize * 1.8) // 18
            ),
        Card(
            // input time
            color: primaryColor,
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
                            fillColor: Colors.yellow[50]),
                        onChanged: (value) {
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
                            fillColor: Colors.yellow[50]),
                        onChanged: (value) {
                          minute = int.parse(value.trim());
                        },
                      ),
                    ),
                  ],
                ))),
        Padding(
            padding: EdgeInsets.all(defaultSize * 3),
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CountDown(
                              hour: hour,
                              minute: minute,
                            )));
              },
              child: Padding(
                  padding: EdgeInsets.all(defaultSize * 1.6),
                  child: Text("Start Journey")),
              style: OutlinedButton.styleFrom(
                  textStyle: TextStyle(
                fontSize: defaultSize * 2.2,
              )),
            ))
      ],
    );
  }
}
