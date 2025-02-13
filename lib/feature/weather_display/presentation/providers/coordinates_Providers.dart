import 'package:riverpod/riverpod.dart';
import 'package:weather_app/feature/weather_display/data/repository/coordinates_repo.dart';
import 'package:weather_app/feature/weather_display/domain/entity/coordinates_entity.dart';
import 'package:weather_app/feature/weather_display/domain/usecases/get_coordinates.dart';

import 'Coordinates_Providing_Notifiers.dart';

final coordinatesRepoProvider = Provider(
  (ref) => CoordinatesRepositoryIMPL(),
);

final coordinatesUsecaseProvider = Provider(
  (ref) => GetCoordinates(ref.read(coordinatesRepoProvider)),
);

final coordinatesProvider = FutureProvider(
  (ref) async {
    Coordinates coordinates = await ref.read(coordinatesUsecaseProvider)();
    ref.read(coordinatesProvidingNotifier.notifier).updateCoordinates(coordinates);
    return coordinates;
  },
);
