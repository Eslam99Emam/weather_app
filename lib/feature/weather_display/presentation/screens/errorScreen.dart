// ignore_for_file: prefer_const_constructors, file_names, must_be_immutable

import 'package:flutter/material.dart';

class Errorscreen extends StatelessWidget {
  var error;
  var stackTrace;

  Errorscreen({super.key, this.error, this.stackTrace});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ValueKey("error"),
      body: Center(
        child: Column(
          children: [
            Text(
              "Error",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .apply(color: Colors.red),
            ),
            Text("$error\n|||||||||\n$stackTrace"),
          ],
        ),
      ),
    );
  }
}
