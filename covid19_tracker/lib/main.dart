// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'login.dart';
import 'dashboard.dart';

void main() => runApp(MyApp());
=======
//import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'screens/home.dart';

PageController pageController = PageController(initialPage: 0);
int currentIndex = 0;

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   SystemChrome.setEnabledSystemUIOverlays([]);
//   runApp(
//     DevicePreview(
//       builder: (context) => MyApp(),
//     ),
//   );
// }

// void main() {
//   //setupLocator();
//   runApp(App());
// }

void setupLocator() {
  GetIt.instance.registerLazySingleton(() => NotesService());
}
>>>>>>> Stashed changes


<<<<<<< Updated upstream
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19 Tracker',
      initialRoute: '/',
          routes: {
            //'/': (context) => new Login(),
            '/': (context) => new Dashboard(),
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
=======
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //locale: DevicePreview.of(context).locale,
      //builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primaryColor: Colors.deepOrange[300],
        backgroundColor: Colors.deepOrange[50],
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
>>>>>>> Stashed changes
    );
  }
}