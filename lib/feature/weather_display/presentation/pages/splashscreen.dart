import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/feature/weather_display/data/datasource/get_weather.dart';
import 'package:weather_app/feature/weather_display/data/repository/coordinates_repo.dart';
import 'package:weather_app/feature/weather_display/data/repository/location_repo.dart';
import 'package:weather_app/feature/weather_display/data/repository/weather_repo.dart';
import 'package:weather_app/feature/weather_display/domain/repository/weather_repo.dart';
import 'package:weather_app/feature/weather_display/domain/usecases/get_coordinates.dart';
import 'package:weather_app/feature/weather_display/domain/usecases/get_location.dart';

import '../../domain/entity/location_entity.dart';
import '../../domain/entity/weather_entity.dart';
import '../../domain/usecases/get_weather.dart';

var position;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Position? _coordinates;
  Location? _location;
  Weather? _weather;

  late final GetCoordinates _getCoordinates;
  late final GetLocation _getLocation;
  late final GetWeather _getWeather;

  @override
  void initState() {
    super.initState();
    Dio dio = Dio();
    WeatherCloudDataSource weatherApi = WeatherCloudDataSource(dio: dio);
    WeatherRepository weatherRepository =
        WeatherRepositoryIMPL(weatherApi: weatherApi);
    _getWeather = GetWeather(weatherRepository);
    final coordinates_repo = CoordinatesRepositoryIMPL();
    _getCoordinates = GetCoordinates(coordinates_repo);
    final location_repo = LocationRepositoryIMPL();
    _getLocation = GetLocation(location_repo);
  }

  Future<Position?> fetchcoordinates() async {
    _coordinates = await _getCoordinates();
    log("*" * 100);
    return _coordinates;
  }

  Future<Location?> fetchlocation(Position c) async {
    _location =
        await _getLocation.getLocationbycoordinates(c.latitude, c.longitude);
    log("*" * 100);
    return _location;
  }

  Future<Weather?> fetchweather(Location loc, DateTime date) async {
    _weather = await _getWeather(loc, date);
    return _weather;
  }

  Future? locate() async {
    _coordinates = await fetchcoordinates();
    _location = await fetchlocation(_coordinates!);
    log(_location!.location.toString());
    _weather = await fetchweather(_location!, DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: locate(),
        builder: (context, location) {
          if (location.connectionState == ConnectionState.waiting) {
            return Center(
              child: Lottie.asset("assets/Splash.json"),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Latitude : ${_coordinates!.latitude}",
                  ),
                  Text(
                    "Longitude : ${_coordinates!.longitude}",
                  ),
                  Text(
                    "Country : ${_location!.location.country.toString()}",
                  ),
                  Text(
                    "Administrative Area : ${_location!.location.administrativeArea.toString()}",
                  ),
                  Text(
                    "Street Name : ${_location!.location.street.toString()}",
                  ),
                  Text(
                    "Weather temp : ${_weather!.tempreture.toString()}",
                  ),
                  TextButton(
                    onPressed: () async {
                      setState(() {});
                    },
                    child: Text(
                      "Relocate",
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}


// return FutureBuilder(
//               future: getAllCountries(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.done) {
//                   return ListView.builder(
//                     itemBuilder: (context, index) {
//                       return ListTile(
//                         title: Text(
//                             "${snapshot.data![index].name} ${snapshot.data![index].flag}"),
//                       );
//                     },
//                   );
//                 } else {
//                   return Center(
//                     child: Text("No cities found"),
//                   );
//                 }
//               },
//             );