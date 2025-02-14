import 'dart:developer';

import '../../domain/entity/weather_entity.dart';

class WeatherModel extends Weather {
  WeatherModel({required double temp, required String image, required List day})
      : super(tempreture: temp, image: image, day: day);

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    log(json.toString());
    return WeatherModel(
        temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        image: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
        day: json["forecast"]["forecastday"][0]["hour"]);
  }
}
