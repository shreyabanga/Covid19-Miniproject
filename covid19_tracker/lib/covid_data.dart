import 'package:dio/dio.dart';

Map globalData;
var countryData;

//do something about this?
var date = new DateTime.now().toString();
var dateParse = DateTime.parse(date);
var formattedDate = "${dateParse.year}-${dateParse.month}-${dateParse.day}";

Future<List> getCovidSummary() async {
  List<String> countries = [];
  var response;

  await Dio().get('https://api.covid19api.com/summary').then((value) {
    response = value;
    globalData = response.data['Global'];
    countryData = response.data["Countries"];
    for (Map<dynamic, dynamic> country in countryData) {
      countries.add(country["Country"].toString());
    }
  });

  return countries;
}

Future<List<double>> getCases(String country) async {
  List<double> casesByWeek = [];

  var response = await Dio().get(
      'https://api.covid19api.com/total/country/$country/status/confirmed?from=2020-03-01T00:00:00Z&to=${formattedDate}T00:00:00Z');
  for (int i = 0; i < response.data.length; i += 7)
    casesByWeek.add(response.data[i]['Cases']
        .toDouble()); //[response.data[i]['Date'].toString().substring(0,10)] =

//print(casesByWeek);
  return (casesByWeek);
}
