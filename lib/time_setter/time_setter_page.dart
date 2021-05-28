import 'package:cosmocat/time_setter/body.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';

class TimeSetter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Time Setter"),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
