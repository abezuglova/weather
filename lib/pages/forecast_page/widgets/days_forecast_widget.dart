import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/weather_report.dart';

class DaysForecastWidget extends StatelessWidget {
  final WeatherReport weatherReport;
  const DaysForecastWidget({super.key, required this.weatherReport});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(100, 36, 53, 131),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.watch_later_outlined,
                color: Color.fromARGB(150, 255, 255, 255),
              ),
              const SizedBox(width: 10),
              Text(
                'DAILY FORECAST',
                style: textTheme.bodySmall
                    ?.copyWith(color: Colors.white.withOpacity(0.6)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...weatherReport.forecast.daysForecast.map(
            (day) => _OneDayWeatherWidget(
              oneDayWeather: day,
            ),
          ),
        ],
      ),
    );
  }
}

class _OneDayWeatherWidget extends StatelessWidget {
  final ForecastDay oneDayWeather;
  const _OneDayWeatherWidget({super.key, required this.oneDayWeather});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final imageUrl = oneDayWeather.day.condition.iconUrl;
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            DateFormat('EEEEE').format(oneDayWeather.date),
            style: textTheme.bodyLarge,
          ),
          Row(
            children: [
              Image.network(imageUrl),
              const SizedBox(width: 16),
              Text(
                '${oneDayWeather.day.mintempC.round()}°',
                style: textTheme.bodyLarge,
              ),
              const SizedBox(width: 5),
              Container(
                width: 100,
                height: 3.5,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                '${oneDayWeather.day.maxtempC.round()}°',
                style: textTheme.bodyLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
