import 'package:climaticc/screens/findCity.dart';
import 'package:flutter/material.dart';
import 'package:climaticc/screens/loading.dart';
import 'package:climaticc/service/getWeather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:climaticc/service/location.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class home extends StatefulWidget {
  home({this.locationWeather});
  final locationWeather;

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
    updateScreen(widget.locationWeather);
  }

  AppBar myAppBar() {
    return AppBar(
      // title: Text('Climaticc'),
      // centerTitle: true,
      leading: IconButton(
        highlightColor: Colors.transparent,
        splashRadius: 27.0,
        icon: Icon(
          Icons.my_location_rounded,
          color: Colors.white,
        ),
        onPressed: () async {
          var weatherData = await climate.userCurrentLocation();
          updateScreen(weatherData);
        },
      ),
      actions: [
        IconButton(
            highlightColor: Colors.transparent,
            splashRadius: 27.0,
            icon: Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
            onPressed: () async {
              var typedName = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return searchCity();
              }));
              if (typedName != null) {
                var weatherData = await climate.getCityWeather(typedName);
                updateScreen(weatherData);
              }
            })
      ],
    );
  }

  void updateScreen(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        temperatureMin = 0;
        temperatureMax = 0;
        weatherIcon = 'error';
        cityName = 'Check Internet';
        dayName = '';
        weatherCondition = ':/';
        return;
      }

      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();

      var tempMin = weatherData['main']['temp_min'];
      temperatureMin = tempMin.toInt();

      var tempMax = weatherData['main']['temp_max'];
      temperatureMax = tempMax.toInt();

      var conditions = weatherData['weather'][0]['id'];
      weatherIcon = climate.getWeatherIcon(conditions);

      cityName = weatherData['name'];
      //myCiti = weatherData['name'];

      dayName = DateFormat('EEEE').format(date);

      weatherCondition = weatherData['weather'][0]['main'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: myAppBar(),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    child: Text(
                      '$cityName',
                      style: GoogleFonts.comfortaa(
                          fontSize: 50.0, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    '$dayName',
                    style: GoogleFonts.comfortaa(
                        fontSize: 45.0, color: Colors.grey[350]),
                  )
                ],
              ),
              Image(
                image: AssetImage('assets/$weatherIcon.png'),
                height: 210.0,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      '$temperature°',
                      style: GoogleFonts.comfortaa(
                        fontSize: 50.0,
                        color: Colors.grey[350],
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    '$weatherCondition'.toUpperCase(),
                    style: GoogleFonts.comfortaa(
                      fontSize: 50.0,
                      color: Colors.grey[350],
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/thermometer_low.png'),
                    height: 50.0,
                  ),
                  Text(
                    '$temperatureMin°',
                    style: GoogleFonts.comfortaa(
                      fontSize: 50.0,
                      color: Colors.grey[350],
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Image(
                    image: AssetImage(
                      'assets/thermometer_high.png',
                    ),
                    height: 50.0,
                  ),
                  Text(
                    '$temperatureMax°',
                    style: GoogleFonts.comfortaa(
                      fontSize: 50.0,
                      color: Colors.grey[350],
                      fontWeight: FontWeight.w900,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
