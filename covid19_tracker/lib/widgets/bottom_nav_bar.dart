import 'package:flutter/material.dart';
import '../clipper/wave_clipper.dart';
import 'nav_bar_item.dart';
import '../main.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  setPage() {
    setState(() {
      pageController.jumpToPage(currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Theme.of(context).primaryColor.withAlpha(150),
                        Theme.of(context).primaryColor,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  NavBarItem(setPage: setPage, icon: Icons.event_note, id: 0),
                  Container(),
                  NavBarItem(setPage: setPage, icon: Icons.bubble_chart, id: 1),
                  Container(),
                  NavBarItem(setPage: setPage, icon: Icons.account_box, id: 2),
                ],
              ),
            ),
            Positioned(
              bottom: 15,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Symptom Notes',
                    style: TextStyle(
                        //fontWeight: FontWeight.w500,
                        color: Colors.deepOrange[800]),
                  ),
                  Container(),
                  Text(
                    'World Data',
                    style: TextStyle(
                        //fontWeight: FontWeight.w500,
                        color: Colors.deepOrange[800]),
                  ),
                  Container(),
                  Text(
                    'Symptom Survey',
                    style: TextStyle(
                        //fontWeight: FontWeight.w500,
                        color: Colors.deepOrange[800]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
