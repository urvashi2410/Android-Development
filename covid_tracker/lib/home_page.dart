// ignore_for_file: prefer_const_constructors

import 'package:covid_tracker/Widgets/app_bar.dart';
import 'package:covid_tracker/Widgets/my_card.dart';
import 'package:covid_tracker/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Constants/colors.dart';

import 'package:pie_chart/pie_chart.dart';

var totalCases, population, deaths, todayCases, todayDeath;

// underscore means this list is private to this file only
List _countries = [];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String current = 'no country selected';
  String flag = '';
  num worldDeaths = 0;
  num deathOfThatCountry = 0;
  num activeCasesInWorld = 0;
  num activeCasesOfThatCountry = 0;
  num totalCasesInWorld = 0;
  num totalCasesOfThatCountry = 0;

  void fetchData() async {
    http.Response response = await http.get(Uri.parse(api));
    final countries = json.decode(response.body);
    setState(() {
      _countries = countries;
    });
    for (int i = 0; i < _countries.length; i++) {
      worldDeaths += (_countries[i]['deaths'] / 1000);
      activeCasesInWorld += (_countries[i]['active'] / 1000);
      totalCasesInWorld += (_countries[i]['cases'] / 1000);
    }
  }

  void getData(current) async {
    http.Response response = await http.get(Uri.parse(api + '/' + current));
    final data = json.decode(response.body);
    setState(() {
      totalCases = data['cases'];
      population = data['population'];
      deaths = data['deaths'];
      todayCases = data['todayCases'];
      todayDeath = data['todayDeaths'];
      flag = data['countryInfo']['flag'];
      deathOfThatCountry = data['deaths'];
      activeCasesOfThatCountry = data['active'];
    });
  }

  @override
  // to execute something right after running the app
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              flag.length > 0
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(flag),
                            radius: 40,
                            backgroundColor: Colors.transparent,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            current,
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    )
                  : SizedBox(
                      width: 1,
                    ),
              _countries.isNotEmpty
                  ? DropdownButton(
                      hint: Text('Choose Country'),
                      isExpanded: true,
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                      ),
                      items: _countries.map((country) {
                        return DropdownMenuItem(
                            value: country['country'],
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        country['countryInfo']['flag']),
                                    radius: 20,
                                    backgroundColor: Colors.transparent,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: Text(
                                      country['country'],
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      }).toList(),
                      onChanged: (country) {
                        setState(() {
                          current = country.toString();
                          getData(current);
                        });
                      },
                    )
                  : CircularProgressIndicator(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: MyCard(
                        data: totalCases == null ? '-' : totalCases.toString(),
                        textColor: Colors.white,
                        belowText: 'Total Cases',
                        bgColor: Colors.orange,
                      ),
                    ),
                    Expanded(
                      child: MyCard(
                        data: deaths == null ? '-' : deaths.toString(),
                        textColor: Colors.white,
                        belowText: 'Total Deaths',
                        bgColor: Colors.green,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: MyCard(
                        data: todayCases == null ? '-' : todayCases.toString(),
                        textColor: Colors.white,
                        belowText: 'Today Cases',
                        bgColor: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: MyCard(
                        data: todayDeath == null ? '-' : todayDeath.toString(),
                        textColor: Colors.white,
                        belowText: 'Today Deaths',
                        bgColor: Colors.pink,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: MyCard(
                  data: population.toString(),
                  textColor: Colors.blue,
                  belowText: 'Population',
                  bgColor: red,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Image.network(
                    'https://w7.pngwing.com/pngs/155/502/png-transparent-world-map-map-world-map-miscellaneous-blue-color-thumbnail.png'),
              ),
              Text(
                "Total Deaths",
                style: TextStyle(
                  color: blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(8),
                  child: PieChart(
                    chartValuesOptions:
                        ChartValuesOptions(showChartValuesInPercentage: true),
                    dataMap: {
                      'world': worldDeaths.toDouble(),
                      current: deathOfThatCountry / 1000.toDouble()
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(8),
                  child: PieChart(dataMap: {
                    'Active Cases': activeCasesInWorld.toDouble(),
                    current: activeCasesOfThatCountry / 1000.toDouble(),
                  }),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Container(
                width: double.infinity,
                color: Colors.black,
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    'Made with ❤ by Flydeck',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
