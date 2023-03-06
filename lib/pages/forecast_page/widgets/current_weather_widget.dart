import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_report.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherReport weatherReport;
  const CurrentWeatherWidget({super.key, required this.weatherReport});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        const SizedBox(height: 30),
        Text(
          weatherReport.location.name,
          style: textTheme.headlineSmall,
        ),
        const SizedBox(height: 10),
        Text(
          DateFormat('EEEEE, MMM d')
              .format(weatherReport.currentWeather.lastUpdated),
          style: textTheme.bodyLarge,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  'Sunrise',
                  style: textTheme.bodySmall,
                ),
                Text(
                  weatherReport.forecast.daysForecast[0].astro.sunrise,
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
            Text(
              '${weatherReport.currentWeather.tempC.round()}°',
              style: textTheme.labelLarge,
            ),
            Column(
              children: [
                Text(
                  'Sunset',
                  style: textTheme.bodySmall,
                ),
                Text(
                  weatherReport.forecast.daysForecast[0].astro.sunset,
                  style: textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          weatherReport.currentWeather.condition.text,
          style: textTheme.bodyLarge,
        ),
        const SizedBox(height: 10),
        Text(
          'Wind ${weatherReport.currentWeather.windMph} mhp',
          style: textTheme.bodyMedium,
        ),
      ],
    );
  }
}
