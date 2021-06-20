import 'package:cosmocat/database.dart';
import 'package:cosmocat/home/info.dart';
import 'package:cosmocat/main.dart';
import 'package:cosmocat/models/app_user.dart';
import 'package:cosmocat/time_setter/time_setter_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cosmocat/size_config.dart';
import 'chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Body extends StatefulWidget {
  //AppUser? appUser;
  //Body(this.appUser);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  /*
  User? firebaseUser = FirebaseAuth.instance.currentUser;
  AppUser appUser = DatabaseService().getUser(firebaseUser!.uid);*/

  final FirebaseAuth auth = FirebaseAuth.instance;
  late String name;

  Future<String> getCurrentUserName() async {
    final User user = await auth.currentUser!;
    final uid = user.uid;
    print(uid);

    return DatabaseService().getUser(uid).nickName;
  }

  void getName() async {
    name = await getCurrentUserName();
  }

  @override
  void initState() {
    getName();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    double defaultSize = SizeConfig.defaultSize!;


    return Column(
      children: <Widget>[
        // Info(name: MyApp.appUser.nickName, image: "assets/image/coma_as.png"),
        Info(
            name: name,
            image: "assets/image/coma_as.png"),
        Chart(),
        OutlinedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => TimeSetter()));
          },
          child: Padding(
              padding: EdgeInsets.all(defaultSize * 1.6),
              child: Text("Start Timer")),
          style: OutlinedButton.styleFrom(
              textStyle: TextStyle(
            fontSize: defaultSize * 2.2,
          )),
        )
      ],
    );
  }
}
