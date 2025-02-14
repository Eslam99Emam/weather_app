
import '../entity/location_entity.dart';
import '../entity/weather_entity.dart';

abstract class WeatherRepository {
  Future<Weather> getWeather(Location location, DateTime date);
}
