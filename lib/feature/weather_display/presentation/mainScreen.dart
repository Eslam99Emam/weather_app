// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/init_Provider.dart';
import 'screens/errorScreen.dart';
import 'screens/loadingScreen.dart';
import 'screens/weatherScreen.dart';

class Mainscreen extends ConsumerStatefulWidget {
  const Mainscreen({super.key});

  @override
  ConsumerState<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends ConsumerState<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    final init = ref.watch(initNotifierProvider);

    return PageTransitionSwitcher(
      duration: Duration(milliseconds: 500),
      transitionBuilder: (child, animation, secondaryAnimation) {
        const begin = Offset(1.0, 0.0); // Slide in from the right
        const end = Offset.zero; // End at the center
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      child: init.when(
        loading: () {
          return LoadingScreen();
        },
        error: (error, stackTrace) {
          return Errorscreen();
        },
        data: (value) {
          return Weatherscreen();
        },
      ),
    );
  }
}
