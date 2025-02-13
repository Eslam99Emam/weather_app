import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/weather_entity.dart';

class WeatherProvidingNotifier extends Notifier<Weather?> {
  @override
  Weather? build() => null;

  void updateWeather(Weather weather) {
    state = weather;
  }
}

final weatherProvidingNotifier = NotifierProvider<WeatherProvidingNotifier, Weather?>(WeatherProvidingNotifier.new);