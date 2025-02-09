import 'package:geolocator/geolocator.dart';

import '../repository/coordinates_repo.dart';

class GetCoordinates {
  CoordinatesRepository repository;

  GetCoordinates(this.repository);

  Future<Position?> call() async {
    bool? access = await repository.accesslocation();
    if (access ?? false) {
      return await repository.getcoordinates();
    }
  }
}
