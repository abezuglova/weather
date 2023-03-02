import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_report.dart';

class HoursForecastWidget extends StatelessWidget {
  final WeatherReport weatherReport;
  const HoursForecastWidget({super.key, required this.weatherReport});

  @override
  Widget build(BuildContext context) {
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
                  const _OneHourWeatherWidget(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class _OneHourWeatherWidget extends StatelessWidget {
  const _OneHourWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 60,
      child: Column(
        children: [
          Text(
            'data',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          // Image(image: AssetImage('')),
          Text(
            'data',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
