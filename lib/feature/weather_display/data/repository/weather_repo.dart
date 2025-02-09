import '../../domain/entity/location_entity.dart';
import '../../domain/entity/weather_entity.dart';
import '../../data/models/weather_model.dart';
import '../../domain/repository/weather_repo.dart';
import '../datasource/get_weather.dart';

class WeatherRepositoryIMPL extends WeatherRepository {
  WeatherCloudDataSource weatherApi;

  WeatherRepositoryIMPL({required this.weatherApi});

  // when we start the app
  @override
  Future<Weather> getWeather(Location location, DateTime date) async {
    return weatherApi.fetchWeather(location, date);
  }
}
