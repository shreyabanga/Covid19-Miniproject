import 'package:flutter/material.dart';

class WorldScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'World Data Displayed Here',
        style: TextStyle(fontSize: 30, color: Colors.deepOrange[900]),
      ),
    );
  }
}
// ![A slider widget, consisting of 5 divisions and showing the default value
// indicator.](https://flutter.github.io/assets-for-api-docs/assets/material/slider.png)
//
// The Sliders value is part of the Stateful widget subclass to change the value
// setState was called.

// import 'package:flutter/material.dart';
//
// void main() => runApp(MyApp());
//
// /// This Widget is the main application widget.
// class MyApp extends StatelessWidget {
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         body: MyStatefulWidget(),
//       ),
//     );
//   }
// }
