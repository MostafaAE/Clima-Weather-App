import 'package:auto_size_text/auto_size_text.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:intl/intl.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel = WeatherModel();
  int temperature;
  int condition;
  String cityName;
  IconData weatherIcon;
  var weatherDate;
  var weatherTime;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(var weatherData) {
    setState(() {
      if (weatherData != null) {
        temperature = weatherData['main']['temp'].toInt();
        condition = weatherData['weather'][0]['id'];
        cityName = weatherData['name'];
      } else {
        condition = 900;
        temperature = 0;
        cityName = 'Unable to get weather data.';
      }
      weatherDate = DateFormat.yMMMEd().format(DateTime.now());
      weatherTime = DateFormat.jm().format(DateTime.now());
      weatherIcon = weatherModel.getWeatherIcon(condition);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      WeatherModel weatherModel = WeatherModel();
                      var weatherData = await weatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedCityName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if(typedCityName != null)
                        {
                          var weatherData = await weatherModel.getCityWeather(typedCityName);
                          updateUI(weatherData);
                        }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(weatherIcon,
                      size: 180, color: Colors.white.withAlpha(200)),
                  SizedBox(
                    height: 10,
                  ),
                  AutoSizeText(
                    '$temperature°C',
                    style: kTempTextStyle,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withAlpha(50),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    AutoSizeText(
                      "$cityName",
                      style: kCityTextStyle,
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      "$weatherDate",
                      textAlign: TextAlign.center,
                      style: kTimeTextStyle,
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      "$weatherTime",
                      textAlign: TextAlign.center,
                      style: kTimeTextStyle,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
