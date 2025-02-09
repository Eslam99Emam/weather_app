// ignore_for_file: prefer_const_constructors, file_names

import 'package:country_state_city/country_state_city.dart' hide State;
import 'package:flutter/material.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesscreeSState();
}

class _CountriesscreeSState extends State<CountriesScreen> {
  List<Country>? _countries;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: countries(),
      builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: Colors.lightBlue.shade200,
          body: ListView.builder(
            itemCount: _countries!.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 0.3,
                        ),
                      ),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ListTile(
                          title: Text(
                              "${_countries![index].name} ${_countries![index].flag}"),
                        ),
                      ),
                    ),
                  ),
                  // Divider(
                  //   color: Colors.grey.shade500,
                  //   thickness: 0.5,
                  //   indent: 0,
                  //   endIndent: 0,
                  // ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  countries() async {
    _countries = await getAllCountries();
  }
}