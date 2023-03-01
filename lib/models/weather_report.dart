import 'package:weather_app/models/current_hour_weather.dart';
import 'package:weather_app/models/forecast.dart';
import 'package:weather_app/models/location.dart';

class WeatherReport {
  final Location location;
  final CurrentHourWeather currentHourWeather;
  final Forecast forecast;

  WeatherReport({
    required this.location,
    required this.currentHourWeather,
    required this.forecast,
  });

  factory WeatherReport.fromJson(Map<String, dynamic> json) => WeatherReport(
        location: Location.fromJson(json['location']),
        currentHourWeather: CurrentHourWeather.fromJson(json['current']),
        forecast: Forecast.fromJson(json['forecast']),
      );
}
