import 'package:cosmocat/size_config.dart';
import 'package:cosmocat/time_setter/time_picker.dart';
import 'package:flutter/material.dart';
import 'astronaut_selection_bar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        AstronautSelectionBar(),
        TimePicker(),
      ],
    );
  }
}
