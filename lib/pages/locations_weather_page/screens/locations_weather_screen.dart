import 'package:flutter/material.dart';
import 'package:weather_app/models/short_weather_report.dart';
import 'package:weather_app/pages/locations_weather_page/widgets/location_short_weather_widget.dart';

class LocationsWeatherScreen extends StatelessWidget {
  final List<ShortWeatherReport> shortWeatherReports;
  const LocationsWeatherScreen({super.key, required this.shortWeatherReports});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ColoredBox(
      color: const Color.fromARGB(255, 149, 177, 215),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'SAVED LOCATIONS',
              style: textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (BuildContext context, int index) =>
                  LocationsShortWeatherWidget(
                shortWeatherReport: shortWeatherReports[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: shortWeatherReports.length,
            ),
          ),
        ],
      ),
    );
  }
}
