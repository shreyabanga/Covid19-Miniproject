import 'package:flutter/material.dart';

class InformationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const InformationCard({this.title, this.subtitle, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 110,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Row(children: [
          Image.asset(
            image,
            height: 100,
            width: 100,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 21.0,
                      color: Colors.lightGreen,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
