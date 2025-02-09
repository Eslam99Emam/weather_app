import 'package:geocoding/geocoding.dart' show Placemark;

import '../../domain/entity/location_entity.dart';

class LocationModel extends Location {
  LocationModel({required Placemark location}) : super(location: location);

  factory LocationModel.fromCoordinates(loc) {
    return LocationModel(location: loc);
  }
}
