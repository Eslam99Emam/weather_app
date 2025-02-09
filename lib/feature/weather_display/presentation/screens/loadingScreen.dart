// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey("loading"),
      backgroundColor: Colors.amber,
      body: Center(
        child: Lottie.asset("assets/Splash.json"),
      ),
    );
  }
}