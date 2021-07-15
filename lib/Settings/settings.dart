import 'package:cosmocat/Settings/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false, //fix pixel overflow
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Settings"),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
