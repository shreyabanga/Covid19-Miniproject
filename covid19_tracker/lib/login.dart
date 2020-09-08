import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';

class Login extends StatefulWidget {

   @override
  LoginState createState() => LoginState();

}

class LoginState extends State<Login> {
  String isLoggedIn = "false";
  String userName="";
  
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19 Tracker',
      home: Scaffold(
        appBar: AppBar(
          title: Text(userName),
        ),
        body: Column(
          children: [
            RaisedButton(
            child: Text("login"),
            onPressed: () async{
              
              userName = await signInWithGoogle();
              setState(() {
                isLoggedIn = "true";
              });

              
            }),
            RaisedButton(
            child: Text("logout"),
            onPressed: () async{
  
              await signOut();
              setState(() {
                isLoggedIn = "false";
              });
            }),
          ]),
      ),
    );
  }
}