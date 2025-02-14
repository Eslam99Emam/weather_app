// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/Location_Providing_Notifiers.dart';
import 'package:weather_app/feature/weather_display/presentation/providers/Weather_Providing_Notifiers.dart';
import 'package:weather_app/feature/weather_display/presentation/screens/countriesScreen.dart';

class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({super.key});

  @override
  ConsumerState<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends ConsumerState<WeatherScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.2, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var location = ref.watch(locationProvidingNotifier);
    var weather = ref.watch(weatherProvidingNotifier);

    String format_date(String date) {
      int hour = int.parse(date.split(":")[0]);
      int formated = (hour % 12) + 1;
      return "${formated.toString().padLeft(2, "0")}:00${hour / 12 <= 1 ? "ₐₘ" : "ₚₘ"}";
    }

    return Scaffold(
      key: ValueKey("done"),
      backgroundColor: Color(0xFF91dde3),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(700),
        child: Container(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: Duration(seconds: 1),
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      CountriesScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, -1.0); // Slide in from the top
                    const end = Offset.zero; // End at the center
                    const curve = Curves.easeInOut;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      ),
                    );
                  },
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(child: SizedBox()),
                  Text(
                    "${location?.location.country}",
                    style: Theme.of(context).textTheme.headlineLarge!.apply(
                      shadows: [
                        Shadow(
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 36.sp,
                    shadows: [
                      Shadow(
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Stack(
          children: [
            Positioned(
              child: Lottie.asset("assets/Background.json",
                  height: 400.h, width: 400.w),
              top: 140,
              left: 40,
            ),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "${weather?.tempreture}°C",
                      style: Theme.of(context).textTheme.displayLarge!.apply(
                        color: const Color(0xFFf8c907),
                        shadows: [
                          Shadow(
                            color: Color(0xFF000000),
                            blurRadius: 4.0,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0),
                      child: Text(
                        "Today avg in ${location?.location.country}",
                        style: Theme.of(context).textTheme.titleLarge!.apply(
                          shadows: [
                            Shadow(
                              blurRadius: 3.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: ScaleTransition(
                            scale: _scaleAnimation,
                            child: Image.network(
                              "https:${weather?.image}",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                SizedBox(
                  height: 170.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: weather?.day.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(12.0),
                        padding: EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 16.0),
                        decoration: BoxDecoration(
                            gradient: RadialGradient(colors: [
                              Color(0xAAcff0f3),
                              Color(0xFF40c4ce),
                            ]),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withAlpha(100),
                                blurRadius: 12.0,
                              )
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              format_date(
                                  (weather?.day[index]["time"] as String)
                                      .split(" ")[1]),
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "${weather?.day[index]["temp_c"]}",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Image.network(
                              "https:${weather?.day[index]["condition"]["icon"]}",
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
