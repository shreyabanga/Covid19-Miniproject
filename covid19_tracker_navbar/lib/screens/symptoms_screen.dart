//AKA focus_screen

import 'package:flutter/material.dart';

class SymptomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'Your Past Symptoms Displayed Here',
        style: TextStyle(fontSize: 30, color: Colors.deepOrange[900]),
      ),
    );
  }
}
