import 'package:cosmocat/Town/create_town.dart';
import 'package:cosmocat/components/background.dart';
import 'package:cosmocat/components/rounded_button.dart';
import 'package:cosmocat/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Empty extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                //color: Colors.lightBlue,
                height: AppBar().preferredSize.height,
              ),
              Container(
                height: SizeConfig.screenHeight! * 0.2,
                child: Text("You have not joined a town yet ~",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),),
              ),
              RoundedButton(
                text: "Join or Create a Town",
                press: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => CreateTown()));
                },
              ),
            ],
          ),
        ),);
  }
}
