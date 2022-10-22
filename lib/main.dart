import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather/data/data_source/remote_data_source.dart';
import 'package:weather/weather/data/repository/weather_repository.dart';
import 'package:weather/weather/domain/entities/weather.dart';
import 'package:weather/weather/domain/repository/base_weather_repository.dart';
import 'package:weather/weather/domain/use_cases/get_weather_by_country_name.dart';
import 'package:weather/weather/presentation/screens/app.dart';

void main() async {

  BaseRemoteDataSource baseRemoteDataSource = RemoteDataSource();
  BaseWeatherRepository baseWeatherRepository = WeatherRepository(baseRemoteDataSource);
  Weather weather = await GetWeatherByCountryName(baseWeatherRepository).execute("egypt");
  if (kDebugMode) print(weather);

  runApp(App(weather : weather));
}


