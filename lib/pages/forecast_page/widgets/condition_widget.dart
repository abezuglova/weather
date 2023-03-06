import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_report.dart';

class ConditionWidget extends StatelessWidget {
  final WeatherReport weatherReport;
  const ConditionWidget({super.key, required this.weatherReport});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WindWidget(
          weatherReport: weatherReport,
        ),
        const SizedBox(width: 16),
        FeelsLikeWidget(
          weatherReport: weatherReport,
        ),
      ],
    );
  }
}

class WindWidget extends StatelessWidget {
  final WeatherReport weatherReport;
  const WindWidget({super.key, required this.weatherReport});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 172,
      height: 172,
      decoration: const BoxDecoration(
        color: Color.fromARGB(100, 36, 53, 131),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.arrow_circle_right_outlined,
              color: Colors.white,
              size: 48,
            ),
            const SizedBox(height: 5),
            Text(
              weatherReport.currentWeather.windDir,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              '${weatherReport.currentWeather.windMph} mhp',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FeelsLikeWidget extends StatelessWidget {
  final WeatherReport weatherReport;
  const FeelsLikeWidget({super.key, required this.weatherReport});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 172,
      height: 172,
      decoration: const BoxDecoration(
        color: Color.fromARGB(100, 36, 53, 131),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Feels like',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
            ),
            const SizedBox(height: 5),
            Text(
              '${weatherReport.currentWeather.feelslikeC.round()}°',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 60,
                ),
            ),
          ],
        ),
      ),
    );
  }
}
