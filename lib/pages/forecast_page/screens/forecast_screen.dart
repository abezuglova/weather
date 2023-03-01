import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_report.dart';

class ForecastScreen extends StatelessWidget {
  final WeatherReport weatherReport;
  const ForecastScreen({super.key, required this.weatherReport});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(weatherReport.location.name),
          Text(weatherReport.currentHourWeather.tempC.toString()),
        ],
      ),
    );
  }
}
