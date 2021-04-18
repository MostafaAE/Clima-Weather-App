import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const apiKey = '180caef9e21a90b63cf63a4e1c4a8890';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getWeatherData();

    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getLocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapURL?lat=${location.getLatitude()}&lon=${location.getLongitude()}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getWeatherData();

    return weatherData;
  }

  IconData getWeatherIcon(int condition) {
    if (condition < 300) {
      return FontAwesomeIcons.cloudShowersHeavy;
    } else if (condition < 600) {
      return FontAwesomeIcons.cloudRain;
    } else if (condition < 700) {
      return FontAwesomeIcons.snowflake;
    } else if (condition < 800) {
      return FontAwesomeIcons.smog;
    } else if (condition == 800) {
      return FontAwesomeIcons.cloudSun;
    } else if (condition <= 804) {
      return FontAwesomeIcons.cloud;
    } else {
      return FontAwesomeIcons.exclamationCircle;
    }
  }
}
