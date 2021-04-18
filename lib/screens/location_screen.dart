import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
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
                    onPressed: () {},
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
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
                  Icon(FontAwesomeIcons.sun,
                      size: 180, color: Colors.white.withAlpha(200)),
                  SizedBox(
                    height: 10,
                  ),
                  AutoSizeText(
                    '40°C',
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
                      'Cairo',
                      style: kCityTextStyle,
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      '18 Apr 2021',
                      textAlign: TextAlign.center,
                      style: kTimeTextStyle,
                      maxLines: 1,
                    ),
                    AutoSizeText(
                      '02:00 PM',
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
