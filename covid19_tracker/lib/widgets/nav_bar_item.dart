import 'package:flutter/material.dart';
import '../main.dart';

class NavBarItem extends StatelessWidget {
  final IconData icon;
  final int id;
  final Function setPage;

  const NavBarItem({this.setPage, this.icon, this.id});

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        currentIndex = id;
        setPage();
      },
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Theme.of(context).primaryColor,
        child: CircleAvatar(
          radius: 25,
          backgroundColor: currentIndex == id
              ? Colors.white.withOpacity(0.9)
              : Colors.transparent,
          child: Icon(
            icon,
            color: currentIndex == id
                ? Colors.deepOrange[300]
                : Colors.white.withOpacity(0.9),
          ),
        ),
      ),
    );
  }
}
