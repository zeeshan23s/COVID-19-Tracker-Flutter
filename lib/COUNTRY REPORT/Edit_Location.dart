import 'package:covid_19_tracker/COUNTRY%20REPORT/CountryAccessReport.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Edit_Location extends StatefulWidget {
  @override
  _Edit_LocationState createState() => _Edit_LocationState();
}

class _Edit_LocationState extends State<Edit_Location> {
  List<CountryAccessReport> locations = [
    CountryAccessReport(country: 'Pakistan', flag: 'pakistan.png'),
    CountryAccessReport(country: 'USA', flag: 'usa.png'),
    CountryAccessReport(country: 'Italy', flag: 'italy.png'),
    CountryAccessReport(country: 'China', flag: 'china.png'),
    CountryAccessReport(country: 'India', flag: 'india.png'),
    CountryAccessReport(country: 'Bangladesh', flag: 'bangladesh.png'),
    CountryAccessReport(country: 'Iran', flag: 'iran.png'),
    CountryAccessReport(country: 'Turkey', flag: 'turkey.png'),
    CountryAccessReport(country: 'Japan', flag: 'japan.png'),
    CountryAccessReport(country: 'Malaysia', flag: 'malaysia.png'),
    CountryAccessReport(country: 'Afghanistan', flag: 'afghanistan.png'),
  ];

  void updateLocation(index) async {
    CountryAccessReport report = locations[index];
    await report.accessCountryReport();
    Navigator.pop(context, {
      'country': report.country,
      'flag': report.flag,
      'totalPopulation': report.totalPopulation,
      'totalCases': report.totalCases,
      'totalActive': report.totalActive,
      'totalRecovered': report.totalRecovered,
      'totalDeaths': report.totalDeaths,
      'todayCases': report.todayCases,
      'todayRecovered': report.todayRecovered,
      'todayDeaths': report.todayDeaths,
      'critical': report.critical
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CHOOSE LOCATION"),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 10),
              child: Card(
                  child: ListTile(
                onTap: () {
                  updateLocation(index);
                },
                title: Text(locations[index].country),
                leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('images/${locations[index].flag}')),
              )),
            );
          }),
    );
  }
}
