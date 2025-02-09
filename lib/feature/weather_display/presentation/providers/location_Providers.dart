import 'package:riverpod/riverpod.dart';
import 'package:weather_app/feature/weather_display/data/repository/location_repo.dart';
import 'package:weather_app/feature/weather_display/domain/usecases/get_location.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/location_Notifier.dart';

import '../../domain/entity/location_entity.dart';

final locationRepoProvider = Provider(
  (ref) => LocationRepositoryIMPL(),
);

final locationUsecaseProvider = Provider(
  (ref) => GetLocation(ref.read(locationRepoProvider)),
);

final locationProvider = AsyncNotifierProviderFamily<LocationNotifier, Location,
    LocationNotifierParams>(
  LocationNotifier.new,
);
