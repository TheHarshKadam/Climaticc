import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:climaticc/service/location.dart';

const apiKey = '681bd9aba1e6308c5cddc42c6e66e21a';
const weatherApiLink = 'api.openweathermap.org/data/2.5/weather';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

class Weather {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper('$weatherApiLink?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}

Future<dynamic> userCurrentLocation() async {
  currentLocation location = currentLocation();
  await location.getCurrentLocation();
  NetworkHelper networkHelper = NetworkHelper(
      '$weatherApiLink?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');
  var weatherData = await networkHelper.getData();
  return weatherData;
}

String getWeatherIcon(int conditions) {
  if (conditions < 300) {
    return 'thunder';
  } else if (conditions < 400) {
    return 'drizzle';
  } else if (conditions == 500) {
    return 'rain';
  } else if (conditions < 600) {
    return 'heavy_rain';
  } else if (conditions < 700) {
    return 'snow';
  } else if (conditions < 800) {
    return 'fog';
  } else if (conditions == 800) {
    return 'sun';
  } else if (conditions <= 804) {
    return 'cloud';
  } else {
    return 'thermometer';
  }
}
