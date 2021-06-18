import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Login/log_in.dart';
import '../size_config.dart';
import 'body.dart';

class Collection extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text("Collection"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Body());
  }
}
