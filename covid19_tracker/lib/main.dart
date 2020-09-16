import 'package:covid19_tracker_navbar/services/notes_service.dart';
import 'package:flutter/material.dart';
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

void main() {
  setupLocator();
  runApp(App());
}

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
    );
  }
}
