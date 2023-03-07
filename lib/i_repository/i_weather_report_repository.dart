import 'package:weather_app/models/weather_report.dart';

abstract class IWeatherReportRepository {
  Future<WeatherReport> getWeatherReportByLocationName(String locationName);
}