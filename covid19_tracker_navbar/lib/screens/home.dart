import '../widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import './symptoms_screen.dart';
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
          SymptomScreen(),
          WorldScreen(),
          AddSymptom(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
