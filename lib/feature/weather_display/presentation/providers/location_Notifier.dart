// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/feature/weather_display/domain/entity/coordinates_entity.dart';
import 'package:weather_app/feature/weather_display/domain/entity/location_entity.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/location_Providers.dart';

import 'Location_Providing_Notifiers.dart';

class LocationNotifierParams {
  Coordinates coordinates;
  String? Country;

  LocationNotifierParams(this.coordinates, [this.Country]);
}

class LocationNotifier
    extends FamilyAsyncNotifier<Location, LocationNotifierParams> {
  @override
  Future<Location> build(LocationNotifierParams param) async {
    if (param.Country == null) {
      Location location = await ref
          .read(locationUsecaseProvider)
          .getLocationbycoordinates(
              param.coordinates.lat, param.coordinates.lon);
      ref.read(locationProvidingNotifier.notifier).updateLocation(location);
      return location;
    }
    Location location = await ref
        .read(locationUsecaseProvider)
        .getlocationbyname(param.Country ?? "Germany");
    ref.read(locationProvidingNotifier.notifier).updateLocation(location);
    return location;
  }
}
