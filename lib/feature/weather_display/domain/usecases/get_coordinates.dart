import 'package:geolocator/geolocator.dart';
import 'package:weather_app/feature/weather_display/domain/entity/coordinates_entity.dart';

import '../repository/coordinates_repo.dart';

class GetCoordinates {
  CoordinatesRepository repository;

  GetCoordinates(this.repository);

  Future<Coordinates> call() async {
    bool? access = await repository.accesslocation();
    if (access) {
      return await repository.getcoordinates();
    }
    return Coordinates(lat: 48, lon: 12);
  }
}
