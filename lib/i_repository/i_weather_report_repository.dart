import 'package:weather_app/models/short_weather_report.dart';
import 'package:weather_app/models/weather_report.dart';

abstract class IWeatherReportRepository {
  Future<WeatherReport> getWeatherReportByLocationName(String locationName);
  Future<ShortWeatherReport> getShortWeatherReportByLocationName(String locationName);
  Future<List<ShortWeatherReport>> getShortWeatherReportListByLocationNames(List<String> locationNames);
}