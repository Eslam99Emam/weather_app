import '../entity/location_entity.dart';
import '../repository/weather_repo.dart';

class GetWeather {
  WeatherRepository repository;

  GetWeather({required this.repository});

  Future call(Location location, DateTime date) async {
    return repository.getWeather(location, date);
  }
}
