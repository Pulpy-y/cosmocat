import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home/home_page.dart';

/*
class Login extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          primary: Colors.blue[100],
          textStyle: const TextStyle(fontSize: 20),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => HomePage()));
        },
        child: Text("Login"));
  }
}*/

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login'),),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  hintText: 'Email'
              ),
              onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
              onChanged: (value) {
                setState(() {
                  _password = value.trim();
                });
              },
            ),

          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[
                ElevatedButton(
                    child: Text('Signin'),
                    onPressed: (){
                      auth.signInWithEmailAndPassword(email: _email, password: _password).then((_){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
                      });

                    }),
                ElevatedButton(
                  child: Text('Signup'),
                  onPressed: (){
                    auth.createUserWithEmailAndPassword(email: _email, password: _password).then((_){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
                    });

                  },
                )
              ])
        ],),
    );
  }
}