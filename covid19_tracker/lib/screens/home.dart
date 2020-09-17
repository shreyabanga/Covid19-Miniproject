import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './note_list.dart';
import '../dashboard.dart';
import './symptom_survey.dart';
import '../main.dart';
import '../widgets/bottom_nav_bar.dart';
import '../auth.dart';
import '../adminView.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
  final FirebaseUser user;
  Home({Key key, @required this.user}) : super(key: key);
}

String isAdmin = "";

class HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getDataa();
    print(isAdmin);
  }

  getDataa() async {
    print("firebase user" + widget.user.displayName);
    var temp = await checkAdmin(widget.user);
    setState(() {
      isAdmin = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isAdmin == "admin"
        ? AdminView()
        : Scaffold(
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
