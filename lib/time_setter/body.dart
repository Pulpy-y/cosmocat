import 'package:cosmocat/size_config.dart';
import 'package:flutter/material.dart';
import 'astronaut_selection_bar.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;

    return Column(
      children: <Widget>[
        AstronautSelectionBar(),
      ],
    );
  }
}
