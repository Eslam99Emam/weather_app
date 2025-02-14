// ignore_for_file: prefer_const_constructors, file_names

import 'package:country_state_city/country_state_city.dart' hide State;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/init_Provider.dart';

class CountriesScreen extends ConsumerStatefulWidget {
  const CountriesScreen({super.key});

  @override
  ConsumerState<CountriesScreen> createState() => _CountriesscreeSState();
}

class _CountriesscreeSState extends ConsumerState<CountriesScreen> {
  List<Country> _countries = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: countries(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            backgroundColor: Colors.lightBlue.shade200,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.lightBlue.shade200,
            body: ListView.builder(
              itemCount: _countries.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 0.3.w,
                          ),
                        ),
                      ),
                      child: InkWell(
                        onTap: () async {
                          await ref
                              .read(initNotifierProvider(
                                      "${_countries[index].name}")
                                  .future)
                              .whenComplete(
                            () {
                              Navigator.pop(context);
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ListTile(
                            title: Text(
                                "${_countries[index].name} ${_countries[index].flag}"),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }

  countries() async {
    _countries = await getAllCountries();
  }
}
