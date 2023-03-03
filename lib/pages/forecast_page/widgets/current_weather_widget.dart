import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_report.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherReport weatherReport;
  const CurrentWeatherWidget({super.key, required this.weatherReport});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Text(
          weatherReport.location.name,
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          DateFormat('EEEEE, MMM d').format(DateTime.now()),
          style: const TextStyle(fontSize: 20, color: Colors.white,),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const Text(
                  'Sunrise',
                  style: TextStyle(fontSize: 16, color: Colors.white,),
                ),
                Text(
                  weatherReport.forecast.daysForecast[0].astro.sunrise,
                  style: const TextStyle(fontSize: 18, color: Colors.white,),
                ),
              ],
            ),
            Text(
              '${weatherReport.currentHourWeather.tempC.round()}°',
              style: const TextStyle(fontSize: 100, color: Colors.white,),
            ),
            Column(
              children: [
                const Text(
                  'Sunset',
                  style: TextStyle(fontSize: 16, color: Colors.white,),
                ),
                Text(
                  weatherReport.forecast.daysForecast[0].astro.sunset,
                  style: const TextStyle(fontSize: 18, color: Colors.white,),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          weatherReport.currentHourWeather.condition.text,
          style: const TextStyle(fontSize: 20, color: Colors.white,),
        ),
        const SizedBox(height: 10),
        Text(
          'Wind ${weatherReport.currentHourWeather.windMph} mhp',
          style: const TextStyle(fontSize: 18, color: Colors.white,),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
