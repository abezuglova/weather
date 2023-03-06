import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/current_hour_weather.dart';
import 'package:weather_app/models/weather_report.dart';

class HoursForecastWidget extends StatelessWidget {
  final WeatherReport weatherReport;
  const HoursForecastWidget({super.key, required this.weatherReport});

  @override
  Widget build(BuildContext context) {
    final forecast24hours = weatherReport.get24hoursForecastFromNow();
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(100, 36, 53, 131),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.watch_later_outlined,
                color: Color.fromARGB(150, 255, 255, 255),
              ),
              SizedBox(width: 10),
              Text(
                'HOURLY FORECAST',
                style: TextStyle(
                  color: Color.fromARGB(150, 255, 255, 255),
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 100,
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) =>
                  _OneHourWeatherWidget(
                currentHourWeather: forecast24hours[index],
              ),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: forecast24hours.length,
            ),
          ),

        ],
      ),
    );
  }
}

class _OneHourWeatherWidget extends StatelessWidget {
  final CurrentHourWeather currentHourWeather;
  const _OneHourWeatherWidget({super.key, required this.currentHourWeather});

  @override
  Widget build(BuildContext context) {
    // final imageUrl = currentHourWeather.condition.icon.substring(2);
    return SizedBox(
      height: 100,
      width: 60,
      child: Column(
        children: [
          Text(
            DateFormat('HH').format(currentHourWeather.time),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 5),
          // Image.network(imageUrl),
          const Icon(Icons.cloud, size: 36, color: Colors.white),
          const SizedBox(height: 5),
          Text(
            '${currentHourWeather.tempC.round()}°',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
