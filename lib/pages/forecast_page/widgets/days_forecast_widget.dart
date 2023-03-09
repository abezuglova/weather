import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/weather_report.dart';
import 'dart:math' as math;

class DaysForecastWidget extends StatelessWidget {
  final WeatherReport weatherReport;
  const DaysForecastWidget({super.key, required this.weatherReport});

  @override
  Widget build(BuildContext context) {
    final generalMaxTemp = weatherReport.forecast.daysForecast
        .map((e) => e.day.maxtempC)
        .reduce(math.max)
        .round();
    final generalMinTemp = weatherReport.forecast.daysForecast
        .map((e) => e.day.mintempC)
        .reduce(math.min)
        .round();
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
              generalMaxTemp: generalMaxTemp,
              generalMinTemp: generalMinTemp,
            ),
          ),
        ],
      ),
    );
  }
}

class _OneDayWeatherWidget extends StatelessWidget {
  final ForecastDay oneDayWeather;
  final int generalMaxTemp;
  final int generalMinTemp;
  const _OneDayWeatherWidget(
      {super.key,
      required this.oneDayWeather,
      required this.generalMaxTemp,
      required this.generalMinTemp});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final imageUrl = oneDayWeather.day.condition.iconUrl;
    final dayMaxTemp = oneDayWeather.day.maxtempC.round();
    final dayMinTemp = oneDayWeather.day.mintempC.round();
    final flexStart = dayMinTemp - generalMinTemp;
    final flexTemp = dayMaxTemp - dayMinTemp;
    final flexEnd = generalMaxTemp - dayMaxTemp;

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
                '$dayMinTemp°',
                style: textTheme.bodyLarge,
              ),
              const SizedBox(width: 5),
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 4,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(100, 36, 53, 131),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        if (flexStart > 0)
                          Spacer(
                            flex: flexStart,
                          ),
                        if (flexTemp > 0)
                          Flexible(
                            flex: flexTemp,
                            child: Container(
                              height: 4,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        if (flexEnd > 0)
                          Spacer(
                            flex: flexEnd,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 5),
              Text(
                '$dayMaxTemp°',
                style: textTheme.bodyLarge,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
