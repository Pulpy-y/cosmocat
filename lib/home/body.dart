import 'package:cosmocat/components/loading.dart';
import 'package:cosmocat/database.dart';
import 'package:cosmocat/home/info.dart';
import 'package:cosmocat/time_setter/time_setter_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cosmocat/size_config.dart';
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

    return loading? Loading() : Column(
      children: <Widget>[
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
