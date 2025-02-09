import 'dart:developer';

import '../../domain/entity/weather_entity.dart';

class WeatherModel extends Weather {
  WeatherModel({required double temp, required String image})
      : super(tempreture: temp, image: image);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    log(json.toString());
    return WeatherModel(
        temp: json["current"]["temp_c"],
        image: json["current"]["condition"]["icon"]);
  }
}
