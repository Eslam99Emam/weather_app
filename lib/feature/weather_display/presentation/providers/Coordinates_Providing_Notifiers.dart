import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/coordinates_entity.dart';

class CoordinatesProvidingNotifier extends Notifier<Coordinates?> {
  @override
  Coordinates? build() => null;

  void updateCoordinates(Coordinates coordinates) {
    state = coordinates;
  }
}

final coordinatesProvidingNotifier = NotifierProvider<CoordinatesProvidingNotifier, Coordinates?>(CoordinatesProvidingNotifier.new);