// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
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
        initialRoute: '/',
        routes: {
          '/': (context) => new Login(),
          //'/': (context) => new Dashboard(),
          // '/LogIn': (BuildContext context) => new LoginPage(),
          // '/Redirect': (BuildContext context) => new Redirect(auth: new Auth()),
          // '/SignUp': (BuildContext context) => new InputForm(),
          // '/Form': (BuildContext context) => new InputForm(),
          // '/UploadPet': (BuildContext context) => new UploadPet(),
          //// '/Org_Profile': (BuildContext context) => new OrgProfile(),
          // '/Edit_Pet_Profile': (BuildContext context) => new EditPetProfile(),
          // '/User_Profile' : (BuildContext context) => new UserProfile(),
          //'/': (context) => OrgProfile(),
        });
  }
}
