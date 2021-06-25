import 'package:cosmocat/components/background.dart';
import 'package:cosmocat/size_config.dart';
import 'package:cosmocat/time_setter/time_picker.dart';
import 'package:flutter/material.dart';
import 'astronaut_selection_bar.dart';

class Body extends StatelessWidget {
  //final Size size;
  //Body(this.size);

  @override
  Widget build(BuildContext context) {

    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: SizeConfig.screenHeight! * 0.05,
            ),
            AstronautSelectionBar(),
            TimePicker(),
          ],
        ),
      ),
    );
  }
}
