import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/location_entity.dart';

class LocationProvidingNotifier extends Notifier<Location?> {
  @override
  Location? build() => null;

  void updateLocation(Location location) {
    state = location;
  }
}

final locationProvidingNotifier = NotifierProvider<LocationProvidingNotifier, Location?>(LocationProvidingNotifier.new);