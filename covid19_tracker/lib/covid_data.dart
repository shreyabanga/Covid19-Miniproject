

import 'package:dio/dio.dart';

int dataa;

Map globalData;
var countryData;
List<String> countries = [];

Future<Map> getCovidSummary() async {
    var response = await Dio().get('https://api.covid19api.com/summary');

    globalData = response.data['Global'];
    countryData = response.data["Countries"];
    for(Map<dynamic,dynamic> country in countryData) {
      countries.add(country["Country"].toString());
    }
    print(countryData[177]);


    return response.data;
}

