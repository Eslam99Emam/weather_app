// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/feature/weather_display/domain/entity/coordinates_entity.dart';
import 'package:weather_app/feature/weather_display/domain/entity/location_entity.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/location_Providers.dart';

import 'Location_Providing_Notifiers.dart';

class LocationNotifierParams {
  Coordinates coordinates;
  String? Country;

  LocationNotifierParams(this.coordinates, [this.Country]) {
    log("${this.Country}");
  }
}

class LocationNotifier
    extends FamilyAsyncNotifier<Location, LocationNotifierParams> {
  @override
  Future<Location> build(LocationNotifierParams param) async {
    log("${param}");
    if (param.Country == null) {
      log("param.Country in 1");
      log("${param.Country}");
      log("message" * 10);
      Location location = await ref
          .read(locationUsecaseProvider)
          .getLocationbycoordinates(
              param.coordinates.lat, param.coordinates.lon);
      ref.read(locationProvidingNotifier.notifier).updateLocation(location);
      return location;
    }
    log("param.Country in 2");
    log("${param.Country}");
    log("message" * 10);
    Location location = await ref
        .read(locationUsecaseProvider)
        .getlocationbyname(param.Country ?? "Germany");
    ref.read(locationProvidingNotifier.notifier).updateLocation(location);
    return location;
  }
}
