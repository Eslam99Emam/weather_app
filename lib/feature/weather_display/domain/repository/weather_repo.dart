
import '../entity/location_entity.dart';
import '../entity/weather_entity.dart';

abstract class WeatherRepository {
  // when we start the app
  Future<Weather> getWeather(Location location, DateTime date);
}
