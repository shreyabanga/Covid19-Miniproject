// AKA relax_screen

import 'package:flutter/material.dart';

class WorldScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        'World Data Displayed Here',
        style: TextStyle(fontSize: 30, color: Colors.teal[900]),
      ),
    );
  }
}
