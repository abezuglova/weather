import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_report.dart';
import 'package:weather_app/pages/forecast_page/widgets/current_weather_widget.dart';
import 'package:weather_app/pages/forecast_page/widgets/days_forecast_widget.dart';
import 'package:weather_app/pages/forecast_page/widgets/hours_forecast_widget.dart';

class ForecastScreen extends StatelessWidget {
  final WeatherReport weatherReport;
  const ForecastScreen({super.key, required this.weatherReport});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color.fromARGB(255, 174, 205, 246),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: ListView(
          children: [
            CurrentWeatherWidget(weatherReport: weatherReport),
            HoursForecastWidget(weatherReport: weatherReport),
            DaysForecastWidget(weatherReport: weatherReport),
          ],
        ),
      ),
    );
  }
}
