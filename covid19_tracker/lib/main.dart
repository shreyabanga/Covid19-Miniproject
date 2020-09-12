// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:provider/provider.dart';
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
              // log error to console
              if (snapshot.error != null) {
                print("error");
                return Text(snapshot.error.toString());
              }

              // redirect to the proper page
              return snapshot.hasData ? new Dashboard() : Login();
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
