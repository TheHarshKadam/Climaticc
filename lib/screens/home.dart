import 'package:flutter/material.dart';
import 'package:climaticc/screens/loading.dart';
import 'package:climaticc/service/getWeather.dart';
import 'package:climaticc/service/location.dart';
import 'package:intl/intl.dart';

class home extends StatefulWidget {
  final locationWeather;
  home({this.locationWeather});
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  Weather climate = Weather();
  DateTime date = DateTime.now();

  int? temperature;
  int? temperatureMin;
  int? temperatureMax;
  String? weatherIcon;
  String? cityName;
  String? dayName;
  String? weatherCondition;

  @override
  void initState() {
    super.initState();
  }

  void updateScreen(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        temperatureMin = 0;
        temperatureMax = 0;
        weatherIcon = 'Error';
        cityName = 'Check Internet';
        dayName = 'I need internet';
        weatherCondition = ':/';
        return;
      }
    });

    var temp = weatherData['main']['temp'];
    temperature = temp.toInt();

    var tempMin = weatherData['main']['tempMin'];
    temperatureMin = tempMin.toInt();

    var tempMax = weatherData['main']['tempMax'];
    temperatureMax = tempMax.toInt();

    var conditions = weatherData['weather'][0]['id'];
    weatherIcon = climate.getWeatherIcon(conditions);

    cityName = weatherData['name'];

    dayName = DateFormat('EEEE').format(date);
    weatherCondition = weatherData['weather'][0]['main'];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("HOME PAGE"),
      ),
    );
  }
}
