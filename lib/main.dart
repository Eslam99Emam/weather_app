import 'dart:developer';

import 'package:country_state_city/country_state_city.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/feature/weather_display/presentation/pages/splashscreen.dart';

void func() async {
  log("*" * 100);
  log((await getAllCities()).toString());
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: SplashScreen(),
    );
  }
}
