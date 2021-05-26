import 'package:flutter/material.dart';
import './log_in.dart';
import 'constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Login(), theme: ThemeData(primaryColor: primaryColor));
  }
}
