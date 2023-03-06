import 'package:weather_app/models/current_hour_weather.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/location.dart';

class WeatherReport {
  final Location location;
  final CurrentWeather currentWeather;
  final Forecast forecast;

  WeatherReport({
    required this.location,
    required this.currentWeather,
    required this.forecast,
  });

  factory WeatherReport.fromJson(Map<String, dynamic> json) => WeatherReport(
        location: Location.fromJson(json['location']),
        currentWeather: CurrentWeather.fromJson(json['current']),
        forecast: Forecast.fromJson(json['forecast']),
      );

  List<CurrentHourWeather> get24hoursForecastFromNow() {
    final forecast24hours = <CurrentHourWeather>[];
    final currentTime = DateTime.now().hour + 4;
    for (int index = currentTime;
        index < forecast.daysForecast[0].hours.length;
        index++) {
      forecast24hours.add(forecast.daysForecast[0].hours[index]);
    }
    for (int index = 0; index < currentTime; index++) {
      forecast24hours.add(forecast.daysForecast[1].hours[index]);
    }
    return forecast24hours;
  }
}

class CurrentWeather {
  final DateTime lastUpdated;
  final double tempC;
  final int isDay;
  final double windMph;
  final String windDir;
  final double feelslikeC;
  final Condition condition;

  CurrentWeather({
    required this.lastUpdated,
    required this.tempC,
    required this.isDay,
    required this.windMph,
    required this.windDir,
    required this.feelslikeC,
    required this.condition,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      CurrentWeather(
        lastUpdated: DateTime.parse(json['last_updated']),
        tempC: json['temp_c'],
        isDay: json['is_day'],
        windMph: json['wind_mph'],
        windDir: json['wind_dir'],
        feelslikeC: json['feelslike_c'],
        condition: Condition.fromJson(json['condition']),
      );
}