import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/coordinates_Providers.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/location_Notifier.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/location_Providers.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/weather_Notifier.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/weather_Providers.dart';

import '../../domain/entity/coordinates_entity.dart';
import '../../domain/entity/location_entity.dart';
import '../../domain/entity/weather_entity.dart';

class InitProvider extends AsyncNotifier<(Weather, Location)> {
  @override
  FutureOr<(Weather, Location)> build() async {
    Coordinates coordinates = await ref.watch(coordinatesProvider.future);
    Location location = await ref
        .watch(locationProvider(LocationNotifierParams(coordinates)).future);
    Weather weather = await ref
        .watch(weatherProvider(WeatherNotifierParams(location)).future);
    return (weather, location);
  }
}

final initNotifierProvider =
    AsyncNotifierProvider<InitProvider, (Weather, Location)>(
  InitProvider.new,
);
