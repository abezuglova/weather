import 'package:flutter/material.dart';
import 'package:weather_app/models/short_weather_report.dart';
import 'package:weather_app/routes.dart';

class LocationsShortWeatherWidget extends StatelessWidget {
  final ShortWeatherReport shortWeatherReport;
  const LocationsShortWeatherWidget(
      {super.key, required this.shortWeatherReport});

  @override
  Widget build(BuildContext context) {
    final imageUrl = shortWeatherReport.currentWeather.condition.iconUrl;
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        AppRoutes.forecastPageRoute,
        arguments: shortWeatherReport.location.name,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(100, 36, 53, 131),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.network(imageUrl),
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
      ),
    );
  }
}
