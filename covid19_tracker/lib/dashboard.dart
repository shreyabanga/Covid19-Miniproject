import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'covid_data.dart';
import 'auth.dart';

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard>
    with AutomaticKeepAliveClientMixin<Dashboard> {
  bool loading = true;
  String dropdownValue = "United States of America";
  int country = 179;
  List<double> cases = [];
  List<String> countries = [];

  @override
  void initState() {
    print(loading);
    getData();
    print(loading);
    super.initState();
  }

  getData() async {
    var temp1 = await getCovidSummary();
    var temp = await getCases("united states of america");
    setState(() {
      countries = temp1;
      loading = false;
      cases = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Covid-19 Tracker',
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColorDark,
              leading: RaisedButton(
                  child: Text(
                    "Logout",
                    style: TextStyle(fontSize: 7),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  color: Theme.of(context).primaryColor,
                  //icon: Icon(Icons.account_circle),
                  onPressed: () async {
                    await signOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/logIn', ModalRoute.withName('/logIn'));
                  }),
              title: Text(
                "Dashboard",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
            body: Container(
                child: Column(
              children: [
                // Container(
                //   height: 250,
                //   padding: EdgeInsets.only(left: 20, top: 100),
                //   alignment: Alignment.centerLeft,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //       color: Theme.of(context).primaryColorDark,
                //       borderRadius: BorderRadius.circular(40),
                //       boxShadow: <BoxShadow>[
                //         BoxShadow(
                //             color: Colors.black.withOpacity(0.2),
                //             offset: Offset(1.1, 1.1),
                //             blurRadius: 10),
                //       ]),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Container(
                //         alignment: Alignment.topRight,
                //         child: RaisedButton(
                //             child: Text("Logout"),
                //             shape: RoundedRectangleBorder(
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(20.0))),
                //             color: Theme.of(context).primaryColor,
                //             //icon: Icon(Icons.account_circle),
                //             onPressed: () async {
                //               await signOut();
                //               Navigator.pushNamedAndRemoveUntil(context,
                //                   '/logIn', ModalRoute.withName('/logIn'));
                //             }),
                //       ),
                //       Text('COVID-19',
                //           style: TextStyle(
                //             color: Colors.white.withOpacity(0.6),
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //             fontFamily: 'Roboto',
                //           )),
                //       Text('Dashboard',
                //           style: TextStyle(
                //             color: Colors.white,
                //             fontSize: 40,
                //             fontWeight: FontWeight.bold,
                //             fontFamily: 'Roboto',
                //           )),
                //     ],
                //   ),
                // ),
                loading
                    ? Center(
                        child: Container(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : Expanded(
                        child: Container(
                          //padding: EdgeInsets.only(bottom: 100),

                          child: StaggeredGridView.count(
                            //shrinkWrap: true,
                            padding: EdgeInsets.only(top: 50, bottom: 100),
                            crossAxisCount: 4,
                            crossAxisSpacing: 12.0,
                            mainAxisSpacing: 12.0,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: myTextItems(
                                  "Global Confirmed Cases",
                                  formatNumbers(globalData["NewConfirmed"]) +
                                      " New Confirmed Cases",
                                  formatNumbers(globalData["TotalConfirmed"]),
                                ),
                              ),

                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: myTextItems(
                                      "Total Deaths",
                                      formatNumbers(globalData["NewDeaths"]) +
                                          " New Deaths",
                                      formatNumbers(
                                          globalData["TotalDeaths"]))),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: myTextItems(
                                    "Total Recovered",
                                    formatNumbers(globalData["NewRecovered"]) +
                                        " New Recovered Cases",
                                    formatNumbers(
                                        globalData["TotalRecovered"])),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: mychart1Items(
                                    "Total Confirmed Cases",
                                    formatNumbers(countryData[country]
                                            ["NewConfirmed"]) +
                                        " New Confirmed Cases",
                                    formatNumbers(
                                        countryData[country]["TotalConfirmed"]),
                                    cases),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: myTextItems(
                                      "Total Deaths",
                                      formatNumbers(countryData[country]
                                              ["NewDeaths"]) +
                                          " New Deaths",
                                      formatNumbers(countryData[country]
                                          ["TotalDeaths"]))),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: myTextItems(
                                    "Total Recovered",
                                    formatNumbers(countryData[country]
                                            ["NewRecovered"]) +
                                        " New Recovered Cases",
                                    formatNumbers(countryData[country]
                                        ["TotalRecovered"])),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: mychart2Items("Conversion","0.9M","+19% of target"),
                              // ),
                            ],
                            staggeredTiles: [
                              StaggeredTile.extent(4, 150.0),
                              StaggeredTile.extent(2, 150.0),
                              StaggeredTile.extent(2, 150.0),
                              StaggeredTile.extent(4, 370.0),
                              StaggeredTile.extent(2, 150.0),
                              StaggeredTile.extent(2, 150.0),
                              //StaggeredTile.extent(2, 120.0),
                            ],
                          ),
                        ),
                      ),
              ],
            ))));
  }

  @override
  bool get wantKeepAlive => true;

  Container myTextItems(String title, String subtitle, String value) {
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
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.blueGrey,
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

  Container mychart1Items(
      String title, String subtitle, String value, List data) {
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
                  Container(
                      child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 25,
                    elevation: 16,
                    style: TextStyle(color: Theme.of(context).primaryColorDark),
                    onChanged: (String newValue) async {
                      var temp = await getCases(
                          countryData[countries.indexOf(newValue)]["Slug"]);
                      setState(() {
                        dropdownValue = newValue;
                        country = countries.indexOf(newValue);
                        cases = temp;
                      });
                    },
                    items:
                        countries.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Theme.of(context).accentColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      value,
                      style: TextStyle(
                          fontSize: 30.0,
                          color: Theme.of(context).primaryColorLight),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    // child: Container(height: 150,
                    child: new Sparkline(
                      data: data,
                      pointsMode: PointsMode.all,
                      pointSize: 4.0,
                      pointColor: Theme.of(context).primaryColorDark,
                      lineWidth: 4.0,
                      lineGradient: new LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Theme.of(context).primaryColor,
                          Theme.of(context).accentColor
                        ],
                      ),
                      fillMode: FillMode.below,
                      fillGradient: new LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Theme.of(context).primaryColorDark.withOpacity(0.4),
                          Theme.of(context).primaryColor.withOpacity(0.4),
                          Colors.white.withOpacity(0.4)
                        ],
                      ),
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

  String formatNumbers(int num) {
    if (num >= 1000000)
      return (num / 1000000).toStringAsFixed(2) + "M";
    else if (num >= 1000)
      return (num / 1000).toStringAsFixed(0) + "K";
    else
      return num.toString();
  }

//  LineChartData mainData(List<double> cases) {
//    List<Color> gradientColors = [
//     Colors.white,
//     Color(0xff23b6e6),
//     Color(0xff02d39a),

//   ];
// double count = 1;

// double upperLimitY = cases.reduce(max);
// double upperLimitX = cases.length.toDouble();
// List data = cases.map((c) => FlSpot(count++,c)).toList();

//     return LineChartData(
//       lineTouchData: LineTouchData(enabled: false),
//       gridData: FlGridData(show: false,),
//       titlesData: FlTitlesData(
//         show: true,
//         bottomTitles: SideTitles(
//           showTitles: true,
//           reservedSize: 22,
//           textStyle:
//               const TextStyle(color: Color(0xff68737d), fontSize: 10),
//           getTitles: (value) {
//             switch (value.toInt()) {
//               case 1:
//                 return 'MAR';
//               case 5:
//                 return 'APR';
//               case 9:
//                 return 'MAY';
//               case 13:
//                 return 'JUN';
//               case 17:
//                 return 'JUL';
//               case 21:
//                 return 'AUG';
//               case 25:
//                 return 'SEP';
//             }
//             return '';
//           },
//           margin: 8,
//         ),
//         leftTitles: SideTitles(
//           showTitles: true,
//           textStyle: const TextStyle(
//             color: Color(0xff67727d),
//             fontSize: 15,
//           ),
//           getTitles: (value) {
//             switch (value.toInt()) {
//               case 10000:
//                 return '10k';
//               case 100000:
//                 return '100k';
//               case 1000000:
//                 return '1M';
//             }
//             return '';
//           },
//           //reservedSize: 28,
//           //margin: 12,
//         ),
//       ),
//       borderData:
//           FlBorderData(show: false),

//       minX: 0,
//       maxX: 35,
//       minY: 0,
//       maxY: 10000000,//cases.reduce(max),

//       lineBarsData: [
//         LineChartBarData(
//           spots: data,
//           // [
//           //     FlSpot(0, 1),
//           //     FlSpot(1, 2),
//           //     FlSpot(2, 100),
//           //     //FlSpot(3, 100000),
//           //     //FlSpot(4, 1000),
//           //     //FlSpot(5, 100000),
//           //     ],

//           //show: false,
//           isCurved: true,
//           colors: [Color(0xff23b6e6),Color(0xff02d39a)],
//           barWidth: 5,
//           isStrokeCapRound: true,
//           dotData: FlDotData(
//             show: true,

//           ),
//           belowBarData: BarAreaData(
//             show: true,
//             colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
//             gradientFrom: Offset(1.1, 1.5)
//           ),
//         ),
//       ],
//     );
//   }

}
