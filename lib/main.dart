import 'package:cosmocat/Town/town.dart';
import 'package:cosmocat/count_down/count_down_page.dart';
import 'package:cosmocat/models/app_user.dart';
import 'package:cosmocat/time_setter/time_picker.dart';
import 'package:cosmocat/time_setter/time_setter_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Login/log_in.dart';
import 'constant.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: LoginScreen(), theme: ThemeData(primaryColor: primaryColor));
  }
}
