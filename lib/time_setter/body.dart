import 'package:cosmocat/components/background.dart';
import 'package:cosmocat/size_config.dart';
import 'package:cosmocat/time_setter/focus_button.dart';
import 'package:cosmocat/time_setter/page_variable.dart';
import 'package:cosmocat/time_setter/task_category.dart';
import 'package:cosmocat/time_setter/time_picker.dart';
import 'package:flutter/material.dart';
import 'astronaut_selection_bar.dart';

class Body extends StatefulWidget {
  late String text;
  Body(this.text);

  @override
  _BodyState createState() => _BodyState(this.text);
}

class _BodyState extends State<Body> {
  late String text;
  _BodyState(this.text);

  @override
  void initState() {
    selected = false;
    minute = 0;
    hour = 0;
    selectedTag = 'noTagNow';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TaskCategory(),
            AstronautSelectionBar(),
            TimePicker(),
            FocusButton(text)
          ],
        ),
      ),
    );
  }
}
