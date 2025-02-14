import 'package:intl/intl.dart';

import 'package:dio/dio.dart';

import '../../domain/entity/location_entity.dart';
import '../../domain/entity/weather_entity.dart';
import '../models/weather_model.dart';

class WeatherCloudDataSource {
  Dio dio;

  WeatherCloudDataSource({required this.dio});

  Future<Weather> fetchWeather(Location loc, DateTime date) async {
    String key = "cf8b21501f92414f86611357250802";
    String url =
        "http://api.weatherapi.com/v1/forecast.json?key=${key}&q=${loc.location.country}&dt=${DateFormat('yyyy-MM-dd').format(date)}";

    try {
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        return WeatherModel.fromJson(response.data);
      } else {
        throw Exception("${response.statusCode} ${response.statusMessage}");
      }
    } catch (e) {
      throw Exception("Error fetching weather data $e");
    }
  }
}
