import 'package:geolocator/geolocator.dart';

class Location {
  double _latitude;
  double _longitude;
  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition();

    _latitude = position.latitude;
    _longitude = position.longitude;
  }

  double getLatitude() {
    return _latitude;
  }

  double getLongitude() {
    return _longitude;
  }
}
