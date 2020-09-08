// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19 Tracker',
      initialRoute: '/',
          routes: {
            '/': (context) => new Login(),
            // '/LogIn': (BuildContext context) => new LoginPage(),
            // '/Redirect': (BuildContext context) => new Redirect(auth: new Auth()),
            // '/SignUp': (BuildContext context) => new InputForm(),
            // '/Form': (BuildContext context) => new InputForm(),
            // '/UploadPet': (BuildContext context) => new UploadPet(),
            //// '/Org_Profile': (BuildContext context) => new OrgProfile(),
            // '/Edit_Pet_Profile': (BuildContext context) => new EditPetProfile(),
            // '/User_Profile' : (BuildContext context) => new UserProfile(),
            //'/': (context) => OrgProfile(),
          }
    );
  }
}