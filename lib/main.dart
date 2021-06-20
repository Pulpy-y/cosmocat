import 'package:cosmocat/models/app_user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Login/log_in.dart';
import 'constant.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //static AppUser? appUser;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: LoginScreen(), theme: ThemeData(primaryColor: primaryColor));
  }
}
