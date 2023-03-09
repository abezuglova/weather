import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/i_repository/i_location_repository.dart';
import 'package:weather_app/i_repository/i_weather_report_repository.dart';
import 'package:weather_app/pages/forecast_page/forecast_page.dart';
import 'package:weather_app/pages/locations_weather_page/locations_weather_page.dart';
import 'package:weather_app/repository/location_repository.dart';
import 'package:weather_app/repository/weather_report_repository.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final dio =
      Dio(BaseOptions(baseUrl: 'https://weatherapi-com.p.rapidapi.com'));
      
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<IWeatherReportRepository>(
          create: (context) => WeatherReportRepository(dio),
        ),
        RepositoryProvider<ILocationRepository>(
          create: (context) => LocationRepository(dio),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            bodySmall: TextStyle(fontSize: 16),
            bodyMedium: TextStyle(fontSize: 18),
            bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            headlineSmall: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            labelMedium: TextStyle(fontSize: 60),
            labelLarge: TextStyle(fontSize: 100),
          ).apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
        ),
        home: const ForecastPage(),
      ),
    );
  }
}
