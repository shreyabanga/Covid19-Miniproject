import 'package:flutter/material.dart';
import './note_list.dart';
import '../dashboard.dart';
import './symptom_survey.dart';
import '../main.dart';
import '../widgets/bottom_nav_bar.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: <Widget>[
          NoteList(),
          Dashboard(),
          SymptomSurvey(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
