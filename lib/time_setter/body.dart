import 'package:cosmocat/components/background.dart';
import 'package:cosmocat/size_config.dart';
import 'package:cosmocat/time_setter/focus_button.dart';
import 'package:cosmocat/time_setter/page_variable.dart';
import 'package:cosmocat/time_setter/task_category.dart';
import 'package:cosmocat/time_setter/time_picker.dart';
import 'package:flutter/material.dart';
import 'astronaut_selection_bar.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    selected = false;
    minute = 0;
    hour = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: SizeConfig.screenHeight! * 0.05,
            ),
            TaskCategory(),
            AstronautSelectionBar(),
            TimePicker(),
            FocusButton("Focus Now")
          ],
        ),
      ),
    );
  }
}
