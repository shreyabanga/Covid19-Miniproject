import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {

   @override
  DashboardState createState() => DashboardState();

}

class DashboardState extends State<Dashboard> {

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19 Tracker',
      home: Scaffold(
        
        body: Column(
          children: [
            RaisedButton(
            child: Text("login"),

              
            ),
            RaisedButton(
            child: Text("logout"),
            ),
          ]),
      ),
    );
  }
}