
import 'package:weather_app/feature/weather_display/domain/entity/coordinates_entity.dart';

abstract class CoordinatesRepository {
  // check the location access
  Future<bool> accesslocation();
  // get coordinates
  Future<Coordinates> getcoordinates();
}
