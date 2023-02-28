import 'package:weather_app/models/current_hour_weather.dart';
import 'package:weather_app/models/location.dart';

class WeatherReport {
  final Location location;
  final CurrentHourWeather currentHourWeather;

  WeatherReport(this.location, this.currentHourWeather);
}
