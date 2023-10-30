import 'package:flutter_app/utils/geolocation/constants.dart';
import 'package:geolocator/geolocator.dart';

bool isClose(
    Position studentPosition, double teacherLatitude, double teacherLongitude) {
  double distance = Geolocator.distanceBetween(studentPosition.latitude,
      studentPosition.longitude, teacherLatitude, teacherLongitude);

  if (distance < MAX_DISTANCE_GEOLOCATION) {
    return true;
  }

  return false;
}
