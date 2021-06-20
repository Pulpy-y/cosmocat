import 'package:cosmocat/components/rounded_button.dart';
import 'package:cosmocat/components/rounded_empty_field.dart';
import 'package:cosmocat/components/rounded_input_field.dart';
import 'package:cosmocat/components/rounded_password_field.dart';
import 'package:cosmocat/constant.dart';
import 'package:cosmocat/database.dart';
import 'package:cosmocat/home/home_page.dart';
import 'package:cosmocat/main.dart';
import 'package:cosmocat/models/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'background.dart';

class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String _email, _password, _confirmPassword, _userName;
  final auth = FirebaseAuth.instance;

  Future<void> _register () async {
    try {
      final newUser =
          await auth.createUserWithEmailAndPassword(
          email: _email, password: _password);

      AppUser appUser = new AppUser(
          email: _email, nickName: _userName);


      DatabaseService()
          .addUser(appUser, newUser.user!.uid);
      /*
          .then((value) {
            setState(() {
              appUser.uid = newUser.user!.uid;
              MyApp.appUser = appUser;
            });

            //print (MyApp.appUser!.nickName);
      });*/

      Navigator.of(context)
          .pushReplacement(
            MaterialPageRoute(
                builder: (context) => HomePage()
            )
      );

    } catch (e) {
      print("Exception in registration: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: size.width * 0.8,
                height: size.width * 0.1,
              ),
              RoundedEmptyField(
                title: "Email",
                hintText: "must be correct format",
                onChanged: (value) {_email = value;},
              ),
              RoundedEmptyField(
                title: "Nickname",
                  hintText: "type your nickname",
                  onChanged: (value){_userName = value;}),

              RoundedEmptyField(
                title: "Password",
                hintText: "at least 8 characters",
                onChanged: (value) {_password = value;},
              ),
              RoundedEmptyField(
                title: "Confirm Password",
                hintText: "type your password again",
                onChanged: (value) {_confirmPassword = value;},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: distinctPurple,// background
                        onPrimary: Colors.white,
                        side: BorderSide(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_password == _confirmPassword) {
                          _register();
                        } else {

                        }
                          },
                      child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold)),),
                  ),
                  Container(
                      width: size.width * 0.4,
                      height: size.height * 0.2,
                      child: Image.asset('assets/image/coma_sign_up.png')
                  ),
                ],
              )
          ])
        )
    );

  }
}


      /*
      child: SizedBox(
        width: size.width*0.75,
        height: size.height*0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Email"),
                  TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            //borderSide: const BorderSide(color: Colors. white, width: 2.0),
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          hintText: "format: xxx@xx.com",
                          fillColor: Colors.white70),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          _email = value.trim();
                        });
                      },
                    )
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Nickname"),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          //borderSide: const BorderSide(color: Colors. white, width: 2.0),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        fillColor: Colors.white70),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (_) {},
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Password"),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          //borderSide: const BorderSide(color: Colors. white, width: 2.0),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        hintText: "at least 8 characters",
                        fillColor: Colors.white70),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Confirm Password"),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                          //borderSide: const BorderSide(color: Colors. white, width: 2.0),
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        fillColor: Colors.white70),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        _confirmPassword = value.trim();
                      });
                    },
                  )
                ],
              ),
            )
          ],

        ),
      )
    );
  }
}*/
