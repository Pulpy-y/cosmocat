import 'package:cosmocat/components/background.dart';
import 'package:cosmocat/Signup/sign_up.dart';
import 'package:cosmocat/components/rounded_button.dart';
import 'package:cosmocat/components/rounded_input_field.dart';
import 'package:cosmocat/components/rounded_password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../home/home_page.dart';


class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;
  bool obscure = true;

  Future<void> _logIn () async {
    print("log in");
    try {
      final user =
      (await auth.signInWithEmailAndPassword(
          email: _email, password: _password)).user;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${user!.uid} signed in'),
        ),
      );

      Navigator.of(context)
          .pushReplacement(
          MaterialPageRoute(
              builder: (context) => HomePage()
          )
      ); } catch (e) {
      print("error");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to sign in with Email & Password'),
        ),
      );
    }}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Background(
        child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.1),
                  Container(
                      width: size.width * 0.5,
                      height: size.height * 0.25,
                      child: Image.asset('assets/image/coma_sit_trans.png')
                  ),
                  SizedBox(
                    width: size.width * 0.5,
                    height: size.height * 0.05,
                  ),
                  RoundedInputField(
                    hintText: "Your Email",
                    onChanged: (value) {setState(() {
                      _email = value.trim();
                    });},
                  ),
                  RoundedPasswordField(
                    icon: Icons.lock,
                    text: "Password",
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
                  ),
                  /*
                  TextFieldContainer(
                    child: TextField(
                      obscureText: obscure,
                      onChanged: (value) {
                        setState(() {
                          _password = value.trim();
                        });
                      },
                      cursorColor: themePrimaryColor,
                      decoration: InputDecoration(
                        hintText: "Password",
                        icon: Icon(
                          Icons.lock,
                          color: themePrimaryColor,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscure? Icons.visibility : Icons.visibility_off,
                            color: themePrimaryColor,),
                          onPressed: () {setState(() {
                            obscure = !obscure;
                          });},
                        ),
                        border: InputBorder.none,

                      ),
                    ),
                  ),*/
                  RoundedButton(
                      text: "Log In",
                      press: () async {
                        await _logIn();
                      }),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                                style: ElevatedButton.styleFrom(
                                  textStyle: TextStyle(fontWeight:FontWeight.bold),
                                    onPrimary: Colors.white// background
                                ),
                                child: Text('Sign Up'),
                                onPressed: (){
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (_) => SignUpScreen()));}),
                            Text("OR",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic
                              ),
                            ),
                            TextButton(
                                style: ElevatedButton.styleFrom(
                                    textStyle: TextStyle(fontWeight:FontWeight.bold),
                                    onPrimary: Colors.white// background
                                ),
                                onPressed: () async {
                                  auth.signInAnonymously().then((_) {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context) => HomePage()));
                                  });
                                },
                                child: Text('Guest Login'))
                          ]
                      )
                  )
                ])));
  }
}