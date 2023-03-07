import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/i_repository/i_weather_report_repository.dart';
import 'package:weather_app/pages/forecast_page/forecast_page.dart';
import 'package:weather_app/repository/weather_report_repository.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IWeatherReportRepository> (
      create: (context) => WeatherReportRepository(
        Dio(
          BaseOptions(baseUrl: 'https://weatherapi-com.p.rapidapi.com'),
        ),
      ),
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
