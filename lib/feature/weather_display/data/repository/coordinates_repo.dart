import 'package:geolocator/geolocator.dart';
import 'package:weather_app/feature/weather_display/domain/entity/coordinates_entity.dart';

import '../../domain/repository/coordinates_repo.dart';

class CoordinatesRepositoryIMPL extends CoordinatesRepository {
  @override
  Future<bool> accesslocation() async {
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
  Future<Coordinates> getcoordinates() async {
    Position position = await Geolocator.getCurrentPosition();
    Coordinates coordinates =
        Coordinates(lat: position.latitude, lon: position.longitude);
    return coordinates;
  }
}
