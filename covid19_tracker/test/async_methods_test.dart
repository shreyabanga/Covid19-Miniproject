import '../lib/covid_data.dart';
import 'package:test/test.dart';

void main() {
  //testing getting api data from the server
  //type checking
  test('covid 19 countries from api', () async {
    bool _actual = true;

    var result = await getCovidSummary();
    var temp = result.isNotEmpty;

    expect(temp, _actual);
  });

  //testing if api returns the cases for a country
  test('covid 19 cases from api', () async {
    bool _actual = true;

    var result = await getCases("India");
    var temp = result.isNotEmpty;

    expect(temp, _actual);
  });
}
