import 'package:cosmocat/components/loading.dart';
import 'package:cosmocat/components/rounded_button.dart';
import 'package:cosmocat/database.dart';
import 'package:cosmocat/home/info.dart';
import 'package:cosmocat/home/sidebar.dart';
import 'package:cosmocat/home/todo_card.dart';
import 'package:cosmocat/time_setter/time_setter_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cosmocat/size_config.dart';
import 'package:cosmocat/components/background.dart';

import '../constant.dart';

class Body extends StatefulWidget {
  final User? user;
  Body(this.user);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String name;
  int stars = 0;
  bool loading = true;

  Future<void> getNameAndStars() async {
    name = await DatabaseService().getUserName(widget.user!.uid);
    stars = await DatabaseService().getStars();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getNameAndStars();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize!;

    return loading
        ? Loading()
        : Background(
            child: Padding(
                padding: EdgeInsets.only(top: defaultSize * 5),
                child: Stack(children: [
                  SideBar(),
                  Column(
                    children: <Widget>[
                      Info(name: name),
                      ToDo(),
                      Container(
                          height: SizeConfig.screenHeight! * 0.1,
                          child: RoundedButton(
                            text: "Start Timer",
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => TimeSetter("Focus Now")));
                            },
                          ))
                    ],
                  ),
                ])));
  }
}
