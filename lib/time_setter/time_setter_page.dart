import 'package:cosmocat/components/background.dart';
import 'package:cosmocat/time_setter/body.dart';
import 'package:flutter/material.dart';

class TimeSetter extends StatelessWidget {
  late final text;
  TimeSetter(this.text);

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true, //fix pixel overflow
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Time Setter"),
        centerTitle: true,
      ),
      body: Body(text),
    ));
  }
}
