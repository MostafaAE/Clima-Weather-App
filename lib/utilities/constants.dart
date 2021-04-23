import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: 60.0,
  fontWeight: FontWeight.bold,
);

const kTimeTextStyle = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: 30.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'SourceSansPro',
);

const kCityTextStyle = TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: 45.0,
  fontWeight: FontWeight.bold,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
    size: 35,
  ),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);