import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'adminView.dart';
import 'login.dart';
import 'dashboard.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Covid-19 Tracker',

        
        theme: ThemeData(
          primaryColor: Colors.tealAccent[400],
          primaryColorDark: Colors.tealAccent[700],
          backgroundColor: Colors.tealAccent[100],
          accentColor: Colors.lightGreen,
          primaryColorLight: Colors.redAccent,
          brightness: Brightness.light,
        ),


        home: FutureBuilder<FirebaseUser>(
          future: FirebaseAuth.instance.currentUser(),
          builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.error != null) {
                print("error");
                return Text(snapshot.error.toString());
              }

              return snapshot.hasData ? new AdminView() : Login();
            } else {
              return Center(
                child: Container(
                  child: CircularProgressIndicator(),
                  alignment: Alignment(0.0, 0.0),
                ),
              );
            }
          },
        ),

        //initialRoute: '/',
        routes: {
          //  '/': (context) => new Login(),
          '/dashboard': (context) => new Dashboard(),
          '/logIn': (BuildContext context) => new Login(),
          
        });
  }
}
