import 'package:cosmocat/components/rounded_empty_field.dart';
import 'package:cosmocat/constant.dart';
import 'package:cosmocat/database.dart';
import 'package:cosmocat/home/home_page.dart';
import 'package:cosmocat/models/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cosmocat/components/background.dart';


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
