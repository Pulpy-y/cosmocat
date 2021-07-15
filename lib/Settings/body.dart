import 'package:cosmocat/Login/log_in.dart';
import 'package:cosmocat/components/background.dart';
import 'package:cosmocat/components/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Background(
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RoundedButton(
                    press: () {
                      auth.signOut();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                    }, text: 'Log Out',
                  ),
                )
              ],
            )));
  }
}
