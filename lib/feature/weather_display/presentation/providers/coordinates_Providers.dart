import 'package:riverpod/riverpod.dart';
import 'package:weather_app/feature/weather_display/data/repository/coordinates_repo.dart';
import 'package:weather_app/feature/weather_display/domain/usecases/get_coordinates.dart';

final coordinatesRepoProvider = Provider(
  (ref) => CoordinatesRepositoryIMPL(),
);

final coordinatesUsecaseProvider = Provider(
  (ref) => GetCoordinates(ref.read(coordinatesRepoProvider)),
);

final coordinatesProvider = FutureProvider(
  (ref) => ref.read(coordinatesUsecaseProvider)(),
);