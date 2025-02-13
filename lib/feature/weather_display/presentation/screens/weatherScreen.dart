import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/Location_Providing_Notifiers.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/Weather_Providing_Notifiers.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/init_Provider.dart';

import '../providers/Coordinates_Providing_Notifiers.dart';
import '../providers/location_Notifier.dart';
import '../providers/location_Providers.dart';

class Weatherscreen extends ConsumerWidget {
  const Weatherscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log("Weather Screen");
    var location = ref.watch(locationProvidingNotifier);
    log("${location!.location.country}");
    var weather = ref.watch(weatherProvidingNotifier);
    log("${weather!.tempreture} ${weather.image}");
    return Scaffold(
      key: ValueKey("done"),
      backgroundColor: Colors.lightBlue.shade300,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(700),
        child: GestureDetector(
          onTap: () {},
          child: Container(
            color: Colors.amber,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [],
                    ),
                  ),
                  Text(
                    "${location.location.country}",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Icon(Icons.arrow_drop_down),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.sunny,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "${location.location.country}",
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}
