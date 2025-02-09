import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/feature/weather_display/data/datasource/get_weather.dart';
import 'package:weather_app/feature/weather_display/data/repository/weather_repo.dart';
import 'package:weather_app/feature/weather_display/domain/usecases/get_weather.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/weather_Notifier.dart';

import '../../domain/entity/weather_entity.dart';

final dioProvider = Provider(
  (ref) => Dio(),
);

final weatherDataSourceProvider = Provider(
  (ref) => WeatherCloudDataSource(
    dio: ref.read(dioProvider),
  ),
);

final weatherRepoProvider = Provider(
  (ref) => WeatherRepositoryIMPL(
    weatherApi: ref.read(weatherDataSourceProvider),
  ),
);
final weatherUsecaseProvider = Provider(
  (ref) => GetWeather(
    repository: ref.read(weatherRepoProvider),
  ),
);

final weatherProvider = AsyncNotifierProviderFamily<WeatherNotifier, Weather,
    WeatherNotifierParams>(WeatherNotifier.new);
