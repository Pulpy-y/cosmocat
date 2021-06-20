import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cosmocat/database.dart';
import 'package:cosmocat/main.dart';
import 'package:cosmocat/models/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Login/log_in.dart';
import '../size_config.dart';
import 'body.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final auth = FirebaseAuth.instance;
  /*
  AppUser? appUser = MyApp.appUser;

  @override
  void initState() {
    appUser = MyApp.appUser;
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService().user,
      initialData: null,
      builder: (context, snapshot) {
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
    );
  }
}
