import 'package:covid19_tracker_navbar/services/notes_service.dart';
import 'package:flutter/material.dart';
//import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'screens/home.dart';
<<<<<<< Updated upstream
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'dashboard.dart';
=======
>>>>>>> Stashed changes

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

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< Updated upstream
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

=======
      //locale: DevicePreview.of(context).locale,
      //builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primaryColor: Colors.tealAccent[400],
        primaryColorDark: Colors.tealAccent[700],
        backgroundColor: Colors.tealAccent[100],
        accentColor: Colors.lightGreen,
        primaryColorLight: Colors.redAccent,
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
>>>>>>> Stashed changes
  }
}
