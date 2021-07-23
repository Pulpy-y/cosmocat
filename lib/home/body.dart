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
                child: Stack(
                  children: [
                    Positioned(
                      top: defaultSize * 5,
                      left: defaultSize,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                            width: 40,
                            height: 25,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: primaryColor, width: 1),
                                borderRadius: BorderRadius.all(Radius.circular(5))),
                            child: Text("$stars"), //Number of stars of the users
                          )
                        ],
                      ),
                    ),
                    Positioned(
                        child: SideBar(), right: 0, top: 0),
                    Column(
                    children: <Widget>[
                      Info(name: name, image: "assets/image/coma_as.png"),
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
                  ),]
                )));
  }
}
