import '../widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
<<<<<<< Updated upstream:covid19_tracker_navbar/lib/screens/home.dart
import './symptoms_screen.dart';
=======
import './symptom_summary.dart';
>>>>>>> Stashed changes:covid19_tracker/lib/screens/home.dart
import './world_data.dart';
import './add_symptom.dart';
import '../main.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true,
      //appBar: CustomAppBar(), //We can put this back if we want
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: <Widget>[
<<<<<<< Updated upstream:covid19_tracker_navbar/lib/screens/home.dart
          SymptomScreen(),
=======
          SymptomSummary(),
>>>>>>> Stashed changes:covid19_tracker/lib/screens/home.dart
          WorldScreen(),
          AddSymptom(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
