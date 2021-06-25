import 'package:cosmocat/time_setter/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../size_config.dart';

class TimeSetter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    /*
    Size size = MediaQuery
        .of(context)
        .size;
*/
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false, //fix pixel overflow
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Time Setter"),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
