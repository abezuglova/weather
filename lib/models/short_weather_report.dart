import 'package:weather_app/models/location.dart';
import 'package:weather_app/models/weather_report.dart';

class ShortWeatherReport {
  final Location location;
  final CurrentWeather currentWeather;

  ShortWeatherReport({
    required this.location,
    required this.currentWeather,
  });

  factory ShortWeatherReport.fromJson(Map<String, dynamic> json) =>
      ShortWeatherReport(
        location: Location.fromJson(json['location']),
        currentWeather: CurrentWeather.fromJson(json['current']),
      );
}
