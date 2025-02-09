import '../repository/location_repo.dart';

class GetLocation {
  LocationRepository repository;

  GetLocation(this.repository);

  Future getlocationbyname(String city) {
    return repository.getLocationbyname(city);
  }

  Future getLocationbycoordinates(double lat, double lon) {
    return repository.getLocationbycoordinates(lat, lon);
  }
}
