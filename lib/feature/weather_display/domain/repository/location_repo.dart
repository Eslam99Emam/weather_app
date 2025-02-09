import '../entity/location_entity.dart';

abstract class LocationRepository {
  // when we use the search for a country
  Future<Location> getLocationbyname(String name);
  // when we use our location
  Future<Location> getLocationbycoordinates(double lat, double lon);
}
