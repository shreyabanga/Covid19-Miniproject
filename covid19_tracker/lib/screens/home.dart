import '../widgets/unused_app_bar.dart';
import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import './note_list.dart';
=======
import './symptom_summary.dart';
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
          NoteList(),
=======
          SymptomSummary(),
>>>>>>> Stashed changes
          WorldScreen(),
          SymptomSurvey(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
