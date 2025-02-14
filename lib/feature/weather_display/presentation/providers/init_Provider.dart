// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/Location_Providing_Notifiers.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/coordinates_Providers.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/location_Notifier.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/location_Providers.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/weather_Notifier.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/weather_Providers.dart';

import '../../domain/entity/coordinates_entity.dart';
import '../../domain/entity/location_entity.dart';
import '../../domain/entity/weather_entity.dart';
import 'Coordinates_Providing_Notifiers.dart';

class InitProvider extends FamilyAsyncNotifier<(Weather, Location), String?> {
  @override
  FutureOr<(Weather, Location)> build(String? country) async {
    Coordinates coordinates = await ref.read(coordinatesProvider.future);
    Location location = await ref.read(locationProvider(
            LocationNotifierParams(ref.read(coordinatesProvidingNotifier)!, country))
        .future);
    Weather weather = await ref.read(weatherProvider(
            WeatherNotifierParams(ref.read(locationProvidingNotifier)!))
        .future);
    return (weather, location);
  }
}

final initNotifierProvider =
    AsyncNotifierProvider.family<InitProvider, (Weather, Location), String?>(
  InitProvider.new,
);
