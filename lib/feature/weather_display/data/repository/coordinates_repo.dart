import 'package:geolocator/geolocator.dart';

import '../../domain/repository/coordinates_repo.dart';

class CoordinatesRepositoryIMPL extends CoordinatesRepository {
  // check the location access
  Future<bool?> accesslocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  // get coordinates
  Future<Position?> getcoordinates() async {
    var coordinates = await Geolocator.getCurrentPosition();
    return coordinates;
  }
}
