import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/feature/weather_display/domain/entity/weather_entity.dart';
import 'package:weather_app/feature/weather_display/domain/usecases/get_weather.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/weather_Providers.dart';

import '../../domain/entity/location_entity.dart';
import 'Weather_Providing_Notifiers.dart';

class WeatherNotifierParams {
  Location location;
  DateTime? date;

  WeatherNotifierParams(this.location, [this.date]);
}

class WeatherNotifier
    extends FamilyAsyncNotifier<Weather, WeatherNotifierParams> {
  @override
  Future<Weather> build(WeatherNotifierParams params) async {
    GetWeather usecase = ref.read(weatherUsecaseProvider);
    Weather weather =
        await usecase(params.location, params.date ?? DateTime.now());
    ref.read(weatherProvidingNotifier.notifier).updateWeather(weather);
    return weather;
  }
}
