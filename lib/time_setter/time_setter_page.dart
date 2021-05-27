import 'package:flutter/material.dart';

import '../size_config.dart';

class TimeSetter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Time Setter"),
        centerTitle: true,
      ),
      body: null,
    );
  }
}
