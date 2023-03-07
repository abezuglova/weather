import 'package:flutter/material.dart';
import 'package:weather_app/models/short_weather_report.dart';

class LocationsShortWeatherWidget extends StatelessWidget {
  final ShortWeatherReport shortWeatherReport;
  const LocationsShortWeatherWidget(
      {super.key, required this.shortWeatherReport});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(100, 36, 53, 131),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.cloud, color: Colors.white, size: 36),
              const SizedBox(width: 16),
              Text(
                shortWeatherReport.location.name,
                style: textTheme.bodyLarge,
              ),
            ],
          ),
          Text(
            '${shortWeatherReport.currentWeather.tempC.round()}°',
            style: textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
