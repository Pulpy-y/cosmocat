import 'package:cosmocat/components/loading.dart';
import 'package:cosmocat/components/rounded_button.dart';
import 'package:cosmocat/database.dart';
import 'package:cosmocat/home/info.dart';
import 'package:cosmocat/home/sidebar.dart';
import 'package:cosmocat/time_setter/time_setter_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cosmocat/size_config.dart';
import 'package:cosmocat/components/background.dart';
import 'chart.dart';

class Body extends StatefulWidget {
  final User? user;
  Body(this.user);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String name;
  bool loading = true;

  Future<void> getName() async {
    name = await DatabaseService().getUserName(widget.user!.uid);
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getName();
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
                child: Column(
                  children: <Widget>[
                    Stack(children: <Widget>[
                      Info(name: name, image: "assets/image/coma_as.png"),
                      Positioned(
                          child: SideBar(), right: 0, top: 0)
                    ]),

                    Chart(),
                    RoundedButton(
                        text: "Start Timer",
                        press: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => TimeSetter()));
                        },)
                  ],
                )));
  }
}
