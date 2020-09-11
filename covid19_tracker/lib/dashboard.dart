import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'covid_data.dart';


class Dashboard extends StatefulWidget {

   @override
  DashboardState createState() => DashboardState();

}



class DashboardState extends State<Dashboard> {

  var data = [22.0, 1.0, 1.5, 0.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0,22.0, 1.0, 1.5, 0.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  var data1 = [0.0,-2.0,3.5,-2.0,0.5,0.7,0.8,1.0,2.0,3.0,3.2];

  bool loading = true;
  String dropdownValue = "United States of America";
  int country=177;
  //var covidData, globalData;

@override
  void initState() {
    super.initState();
    print("fetching data");
    getData(); 
    
}


getData() async {
await getCovidSummary();  
  //print(covidData);
  print (dataa);
  setState(() {
    loading = false;
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
          color:Color.fromRGBO(244, 242, 242, 1),
          //color:Colors.amber[800],
          
          child:Column(
            children: [
              
              Container(
                height: 250,
                padding: EdgeInsets.only(left:20,top:100),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color:Colors.black.withOpacity(0.2),
                          offset: Offset(1.1,1.1),
                          blurRadius: 10
                        ),
                        
                      ]
                      
                      
                ),
                
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [

                    Text('COVID-19',
                      
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                    )),

                    Text('Dashboard',
                      
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                    )),
                  ],
                ),
              ),
              
              loading? 
              Center(
                child: Container (
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
                        formatNumbers(globalData["NewConfirmed"]) + " New Confirmed Cases",
                        formatNumbers(globalData["TotalConfirmed"]),
                        ),
                    ),
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: myTextItems(
                      "Total Deaths",
                      formatNumbers(globalData["NewDeaths"]) + " New Deaths",
                      formatNumbers(globalData["TotalDeaths"]))
                      
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: myTextItems(
                      "Total Recovered",
                      formatNumbers(globalData["NewRecovered"]) + " New Recovered Cases",
                      formatNumbers(globalData["TotalRecovered"])),
                  ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: mychart1Items(
                      "Total Confirmed Cases",
                      formatNumbers(countryData[country]["NewConfirmed"])+ " New Confirmed Cases",
                      formatNumbers(countryData[country]["TotalConfirmed"]),
                      data),
                      
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: myTextItems(
                      "Total Deaths",
                      formatNumbers(countryData[country]["NewDeaths"]) + " New Deaths",
                      formatNumbers(countryData[country]["TotalDeaths"]))
                      
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: myTextItems(
                      "Total Recovered",
                      formatNumbers(countryData[country]["NewRecovered"]) + " New Recovered Cases",
                      formatNumbers(countryData[country]["TotalRecovered"])),
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


  Container myTextItems(String title, String subtitle, String value){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: <BoxShadow>[
          BoxShadow(
          color:Colors.black.withOpacity(0.1),
          offset: Offset(10,10),
          blurRadius: 20
          ),
          BoxShadow(
          color:Colors.white.withOpacity(0.8),
          offset: Offset(-5,-5),
          blurRadius: 20
          ),
                        
        ]),

      child: Center(
        child:Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment:MainAxisAlignment.center,
               children: <Widget>[

                  Padding(
                   padding: EdgeInsets.all(8.0),
                      child:Text(title,style:TextStyle(
                        fontSize: 20.0,
                        color: Colors.redAccent,
                      ),),
                    ),

                  

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(subtitle, style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.blueGrey,
                    ),),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Text(value,style:TextStyle(
                      fontSize: 30.0,
                    ),),
                  ),

               ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  


  Container mychart1Items(String title, String subtitle, String value, List data) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: <BoxShadow>[
          BoxShadow(
          color:Colors.black.withOpacity(0.1),
          offset: Offset(10,10),
          blurRadius: 20
          ),
          BoxShadow(
          color:Colors.white.withOpacity(0.8),
          offset: Offset(-5,-5),
          blurRadius: 20
          ),
                        
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
                      style: TextStyle(color: Colors.orange),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                          country = countries.indexOf(newValue);
                        });
                      },
                      items: countries
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ),

                    
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(title, style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.redAccent,
                    ),),
                  ),

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(value, style: TextStyle(
                      fontSize: 30.0,
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(subtitle, style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.blueGrey,
                    ),),
                  ),

                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: new Sparkline(
                      data: data,
                      pointsMode: PointsMode.all,
                      pointSize: 4.0,
                      pointColor: Colors.red,
                      lineWidth: 4.0,
                      lineGradient: new LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.redAccent, Colors.yellow[700]],
                      ),
                      fillMode: FillMode.below,
                      fillGradient: new LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.amber[800].withOpacity(0.6), Colors.amber[200].withOpacity(0.6),Colors.white.withOpacity(0.4)],
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

String formatNumbers(int num){
  if(num >= 1000000)
  return (num/1000000).toStringAsFixed(2) + "M";
  else if(num >=1000)
  return (num/1000).toStringAsFixed(0) + "K";
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