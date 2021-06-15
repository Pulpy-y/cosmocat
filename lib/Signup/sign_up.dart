import 'package:flutter/material.dart';
import 'body.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false, //fix pixel overflow
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Sign Up", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
