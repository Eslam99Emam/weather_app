import 'package:geocoding/geocoding.dart'
    show Placemark, placemarkFromCoordinates;
import '../../domain/entity/location_entity.dart';
import '../../domain/repository/location_repo.dart';

class LocationRepositoryIMPL extends LocationRepository {
  // when we use the search for a country
  Future<Location> getLocationbyname(String name) async {
    return Location(location: Placemark(country: name, ));
  }

  // when we use our location
  Future<Location> getLocationbycoordinates(double lat, double lon) async {
    List placemarks = await placemarkFromCoordinates(lat, lon);
    return Location(location: placemarks[0]);
  }
}
