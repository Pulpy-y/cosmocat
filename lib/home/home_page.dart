import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../log_in.dart';
import '../size_config.dart';
import 'body.dart';

class HomePage extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        actions: [ElevatedButton(child: Text('Logout'),onPressed: (){
          auth.signOut();
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
        },),],
      ),
      body: Body()
    );
  }
}
