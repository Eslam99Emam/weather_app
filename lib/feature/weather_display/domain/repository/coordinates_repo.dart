
import 'package:geolocator/geolocator.dart';

abstract class CoordinatesRepository {
  // check the location access
  Future<bool?> accesslocation();
  // get coordinates
  Future<Position?> getcoordinates();
}
