import 'package:cosmocat/time_setter/body.dart';
import 'package:flutter/material.dart';

class TimeSetter extends StatelessWidget {
  late final text;
  TimeSetter(this.text);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false, //fix pixel overflow
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Time Setter"),
        centerTitle: true,
      ),
      body: Body(text),
    );
  }
}
