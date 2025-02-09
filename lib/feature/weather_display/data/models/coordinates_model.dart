import 'package:geolocator/geolocator.dart';
import '../../domain/entity/coordinates_entity.dart';

class CoordinatesModel extends Coordinates {
  CoordinatesModel({required lat, required lon}) : super(lat: lat, lon: lon);

  factory CoordinatesModel.fromDevice(Position pos) {
    return CoordinatesModel(
      lat: pos.latitude,
      lon: pos.longitude,
    );
  }
}
