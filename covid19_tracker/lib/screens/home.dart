import '../widgets/unused_app_bar.dart';
import 'package:flutter/material.dart';
import './note_list.dart';
import './world_data.dart';
import './symptom_survey.dart';
import '../main.dart';
import '../widgets/bottom_nav_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: <Widget>[
          NoteList(),
          WorldScreen(),
          SymptomSurvey(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
