import 'package:flutter/material.dart';
import 'package:weather/weather/domain/entities/weather.dart';
import 'package:weather/weather/presentation/screens/home_screen.dart';

class App extends StatelessWidget {
   App({Key? key,required this.weather}) : super(key: key);

   Weather weather;

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(weather : weather),
    );
  }
}
