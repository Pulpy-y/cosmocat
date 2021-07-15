import 'package:cosmocat/components/background.dart';
import 'package:cosmocat/components/rounded_button.dart';
import 'package:cosmocat/constant.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  double defaultSize = SizeConfig.defaultSize!;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TextStyle _textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22, //22
      color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Column(children: <Widget>[
      SizedBox(
        height: SizeConfig.screenHeight! * 0.2,
      ),
      _datepicker(),
      _timepicker(),
      IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_right_alt_rounded,
            color: Colors.white,
            size: defaultSize * 5,
          ))
    ]));
  }

  Widget _datepicker() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Choose date", style: _textStyle),
        TextButton(
          child: Text(selectedDate.toString().split(" ").first),
          style: TextButton.styleFrom(
            fixedSize: Size(defaultSize * 20, defaultSize * 4),
            primary: primaryColor,
            textStyle: _textStyle,
            backgroundColor: Colors.white,
          ),
          onPressed: () => showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2021, 12),
          ).then((pickedDate) {
            setState(() {
              if (pickedDate != null) selectedDate = pickedDate;
            });
          }),
        )
      ],
    );
  }

  Widget _timepicker() {
    return Column(
      children: <Widget>[
        Text("Choose time", style: _textStyle),
        TextButton(
          child: Text("${selectedTime.hour}:${selectedTime.minute}"),
          style: TextButton.styleFrom(
            fixedSize: Size(defaultSize * 20, defaultSize * 4),
            primary: primaryColor,
            textStyle: _textStyle,
            backgroundColor: Colors.white,
          ),
          onPressed: () => showTimePicker(
            initialTime: selectedTime,
            context: context,
          ).then((pickedDate) {
            setState(() {
              if (pickedDate != null) selectedTime = pickedDate;
            });
          }),
        )
      ],
    );
  }
}
