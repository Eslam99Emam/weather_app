import 'package:flutter/material.dart';

class Weatherscreen extends StatelessWidget {
  const Weatherscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey("done"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Done",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ],
      ),
    );
  }
}
