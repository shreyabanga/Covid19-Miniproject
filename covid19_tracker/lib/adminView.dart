import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'user_data.dart';
import 'auth.dart';

class AdminView extends StatefulWidget {
  @override
  AdminState createState() => AdminState();
}

class AdminState extends State<AdminView> {
  bool loading = true;
  List usersSubmitted;
  List<Map<String, dynamic>> usersNotSubmitted;
  Map symptomStats;

  var formattedDate;

  @override
  void initState() {
    super.initState();
    print("fetching data");
    _getData();
  }

  _getData() async {
    var temp = await missingForms();
    var temp1 = await getStats();
    setState(() {
      loading = false;
      usersSubmitted = temp[0];
      usersNotSubmitted = temp[1];
      symptomStats = temp1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid-19 Tracker',
      home: Scaffold(
        body: Container(
          //padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          color: Color.fromRGBO(244, 242, 242, 1),
          //color:Colors.amber[800],

          child: Column(
            children: [
              Container(
                height: 250,
                padding: EdgeInsets.only(left: 20, top: 100),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: Offset(1.1, 1.1),
                          blurRadius: 10),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: RaisedButton(
                          child: Text("Logout"),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          color: Theme.of(context).primaryColor,
                          //icon: Icon(Icons.account_circle),
                          onPressed: () async {
                            await signOut();
                            Navigator.pushNamedAndRemoveUntil(context, '/logIn',
                                ModalRoute.withName('/logIn'));
                          }),
                    ),
                    Text('COVID-19',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        )),
                    Text('Admin Dashboard',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto',
                        )),
                  ],
                ),
              ),
              loading
                  ? Center(
                      child: Container(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : Expanded(
                      child: Container(
                        child: StaggeredGridView.count(
                          //shrinkWrap: true,
                          crossAxisCount: 4,
                          crossAxisSpacing: 12.0,
                          mainAxisSpacing: 12.0,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myTextItems(
                                "Number of Submitted Forms Today",
                                usersSubmitted.length.toString(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myTextItems(
                                "Number of NOT Submitted Forms",
                                usersNotSubmitted.length.toString(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myListItems(
                                "Users who submitted:",
                                usersSubmitted,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myListItems(
                                "Users who did NOT submitted:",
                                usersNotSubmitted,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                    "% users having the following symptoms:",
                                    style: TextStyle(
                                      fontSize: 18,
                                    )),
                                color: Colors.red[100],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myTextItems(
                                  "Fever", symptomStats['fever'].toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myTextItems(
                                "Cough",
                                symptomStats['cough'].toString(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myTextItems(
                                "Headache",
                                symptomStats['headache'].toString(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myTextItems(
                                "Nausea",
                                symptomStats['nausea'].toString(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myTextItems(
                                "Diarrhea",
                                symptomStats['diarrhea'].toString(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myTextItems(
                                "Fatigue",
                                symptomStats['fatigue'].toString(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myTextItems(
                                "Sore Throat",
                                symptomStats['soreThroat'].toString(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myTextItems(
                                "Chest Pain",
                                symptomStats['chestPain'].toString(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myTextItems(
                                "Weak sense of smell",
                                symptomStats['smell'].toString(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myTextItems(
                                "Weak sense of taste",
                                symptomStats['taste'].toString(),
                              ),
                            ),
                          ],
                          staggeredTiles: [
                            StaggeredTile.extent(4, 150.0),
                            StaggeredTile.extent(4, 150.0),
                            StaggeredTile.extent(4, 300.0),
                            StaggeredTile.extent(4, 300.0),
                            StaggeredTile.extent(4, 100.0),
                            StaggeredTile.extent(2, 150.0),
                            StaggeredTile.extent(2, 150.0),
                            StaggeredTile.extent(2, 150.0),
                            StaggeredTile.extent(2, 150.0),
                            StaggeredTile.extent(2, 150.0),
                            StaggeredTile.extent(2, 150.0),
                            StaggeredTile.extent(2, 150.0),
                            StaggeredTile.extent(2, 150.0),
                            StaggeredTile.extent(4, 130.0),
                            StaggeredTile.extent(4, 130.0),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Container myListItems(String title, List data) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(10, 10),
                blurRadius: 20),
            BoxShadow(
                color: Colors.white.withOpacity(0.8),
                offset: Offset(-5, -5),
                blurRadius: 20),
          ]),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20.0,
                color: Theme.of(context).accentColor,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(2.0),
              child: Container(
                color: Colors.green[50],
                height: 170,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      Divider(height: 1, color: Colors.green),
                  itemBuilder: (_, index) {
                    return ListTile(
                        title: Text(
                          data[index]['name'],
                          style: TextStyle(color: Colors.tealAccent[700]),
                        ),
                        subtitle: Text(
                          data[index]['email'],
                        ));
                  },
                  itemCount: data.length,
                ),
              )),
        ],
      ),
    );
  }

  Container myTextItems(String title, String value) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(10, 10),
                blurRadius: 20),
            BoxShadow(
                color: Colors.white.withOpacity(0.8),
                offset: Offset(-5, -5),
                blurRadius: 20),
          ]),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      value,
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Theme.of(context).primaryColorLight),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Container mychart1Items(
  //     String title, String subtitle, String value, List data) {
  //   return Container(
  //     decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(20),
  //         boxShadow: <BoxShadow>[
  //           BoxShadow(
  //               color: Colors.black.withOpacity(0.1),
  //               offset: Offset(10, 10),
  //               blurRadius: 20),
  //           BoxShadow(
  //               color: Colors.white.withOpacity(0.8),
  //               offset: Offset(-5, -5),
  //               blurRadius: 20),
  //         ]),
  //     child: Center(
  //       child: Padding(
  //         padding: EdgeInsets.all(8.0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: <Widget>[
  //                 Container(
  //                     child: DropdownButton<String>(
  //                   value: dropdownValue,
  //                   icon: Icon(Icons.keyboard_arrow_down),
  //                   iconSize: 25,
  //                   elevation: 16,
  //                   style: TextStyle(color: Theme.of(context).primaryColorDark),
  //                   onChanged: (String newValue) async {
  //                     var temp = await getCases(
  //                         countryData[countries.indexOf(newValue)]["Slug"]);
  //                     setState(() {
  //                       dropdownValue = newValue;
  //                       country = countries.indexOf(newValue);
  //                       cases = temp;
  //                     });
  //                   },
  //                   items:
  //                       countries.map<DropdownMenuItem<String>>((String value) {
  //                     return DropdownMenuItem<String>(
  //                       value: value,
  //                       child: Text(value),
  //                     );
  //                   }).toList(),
  //                 )),
  //                 Padding(
  //                   padding: EdgeInsets.all(1.0),
  //                   child: Text(
  //                     title,
  //                     style: TextStyle(
  //                       fontSize: 20.0,
  //                       color: Theme.of(context).accentColor,
  //                     ),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.all(1.0),
  //                   child: Text(
  //                     value,
  //                     style: TextStyle(
  //                         fontSize: 30.0,
  //                         color: Theme.of(context).primaryColorLight),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.all(1.0),
  //                   child: Text(
  //                     subtitle,
  //                     style: TextStyle(
  //                       fontSize: 12.0,
  //                       color: Colors.blueGrey,
  //                     ),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.all(20.0),
  //                   child: new Sparkline(
  //                     data: data,
  //                     pointsMode: PointsMode.all,
  //                     pointSize: 4.0,
  //                     pointColor: Theme.of(context).primaryColorDark,
  //                     lineWidth: 4.0,
  //                     lineGradient: new LinearGradient(
  //                       begin: Alignment.topCenter,
  //                       end: Alignment.bottomCenter,
  //                       colors: [
  //                         Theme.of(context).primaryColor,
  //                         Theme.of(context).accentColor
  //                       ],
  //                     ),
  //                     fillMode: FillMode.below,
  //                     fillGradient: new LinearGradient(
  //                       begin: Alignment.topCenter,
  //                       end: Alignment.bottomCenter,
  //                       colors: [
  //                         Theme.of(context).primaryColorDark.withOpacity(0.4),
  //                         Theme.of(context).primaryColor.withOpacity(0.4),
  //                         Colors.white.withOpacity(0.4)
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  String formatNumbers(int num) {
    if (num >= 1000000)
      return (num / 1000000).toStringAsFixed(2) + "M";
    else if (num >= 1000)
      return (num / 1000).toStringAsFixed(0) + "K";
    else
      return num.toString();
  }
}
