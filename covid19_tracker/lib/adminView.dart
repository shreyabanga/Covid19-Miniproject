import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'covid_data.dart';
import 'auth.dart';

class AdminView extends StatefulWidget {
  @override
  AdminState createState() => AdminState();
}

class AdminState extends State<AdminView> {
  
  bool loading = true;
  String dropdownValue = "United States of America";
  int country = 179;
  List<double> cases = [];
  List<String> countries = [];


  @override
  void initState() {
    super.initState();
    print("fetching data");
    getData();
  }

  getData() async {
    var temp1 = await getCovidSummary();

    var temp = await getCases("india");
    print("here");
    setState(() {
      countries = temp1;
      loading = false;
      cases = temp;

      //globalData = covidData["Global"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                   IconButton(
                     icon: Icon(Icons.account_circle),
                      onPressed: () async{
                        await signOut();
                        Navigator.pushNamedAndRemoveUntil(
            context, '/logIn', ModalRoute.withName('/logIn'));

                   }),
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
                                    formatNumbers(globalData["TotalDeaths"]))),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myTextItems(
                                  "Total Recovered",
                                  formatNumbers(globalData["NewRecovered"]) +
                                      " New Recovered Cases",
                                  formatNumbers(globalData["TotalRecovered"])),
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
                                    formatNumbers(
                                            countryData[country]["NewDeaths"]) +
                                        " New Deaths",
                                    formatNumbers(
                                        countryData[country]["TotalDeaths"]))),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: myTextItems(
                                  "Total Recovered",
                                  formatNumbers(countryData[country]
                                          ["NewRecovered"]) +
                                      " New Recovered Cases",
                                  formatNumbers(
                                      countryData[country]["TotalRecovered"])),
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
          ),
        ),
      ),
    );
  }

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

  // Container mychart2Items(String title, String priceVal,String subtitle) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(20),
  //       boxShadow: <BoxShadow>[
  //         BoxShadow(
  //         color:Colors.black.withOpacity(0.1),
  //         offset: Offset(10,10),
  //         blurRadius: 20
  //         ),
  //         BoxShadow(
  //         color:Colors.white.withOpacity(0.8),
  //         offset: Offset(-5,-5),
  //         blurRadius: 20
  //         ),

  //       ]),
  //     child: Center(
  //       child: Padding(
  //         padding: EdgeInsets.all(8.0),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: <Widget>[
  //             Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: <Widget>[

  //                 Padding(
  //                   padding: EdgeInsets.all(1.0),
  //                   child: Text(title, style: TextStyle(
  //                     fontSize: 20.0,
  //                     color: Colors.blueAccent,
  //                   ),),
  //                 ),

  //                 Padding(
  //                   padding: EdgeInsets.all(1.0),
  //                   child: Text(priceVal, style: TextStyle(
  //                     fontSize: 30.0,
  //                   ),),
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.all(1.0),
  //                   child: Text(subtitle, style: TextStyle(
  //                     fontSize: 20.0,
  //                     color: Colors.blueGrey,
  //                   ),),
  //                 ),

  //                 Padding(
  //                   padding: EdgeInsets.all(1.0),
  //                   child: new Sparkline(
  //                     data: data1,
  //                     fillMode: FillMode.below,
  //                     fillGradient: new LinearGradient(
  //                       begin: Alignment.topCenter,
  //                       end: Alignment.bottomCenter,
  //                       colors: [Colors.amber[800], Colors.amber[200]],
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

}
