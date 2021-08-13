import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:climaticc/service/getWeather.dart';
import 'package:climaticc/screens/home.dart';

class loading extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _loadingState();
  }
}

class _loadingState extends State<loading> {
  @override
  void initState() {
    super.initState();
    getLocationWeather();
  }

  @override
  void getLocationWeather() async {
    var weatherData = await Weather().myCityWeather();
    print(weatherData);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return home(
        locationWeather: weatherData,
      );
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 30.0,
        ),
      ),
    );
  }
}
