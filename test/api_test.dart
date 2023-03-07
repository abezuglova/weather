import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/repository/location_repository.dart';
import 'package:weather_app/repository/weather_report_repository.dart';

void main() {
  test('Locations list get by name', () async {
    final dio = Dio(
      BaseOptions(baseUrl: 'https://weatherapi-com.p.rapidapi.com'),
    );
    final repository = LocationRepository(dio);
    final suggestions = await repository.getLocationsByName('Novo');
    print(suggestions);
    assert(suggestions.isNotEmpty);
  });

  test('Weather report get by location name', () async {
    final dio = Dio(
      BaseOptions(baseUrl: 'https://weatherapi-com.p.rapidapi.com'),
    );
    final repository = WeatherReportRepository(dio);
    final report =
        await repository.getWeatherReportByLocationName('London');
    expect(3, report.forecast.daysForecast.length);
    print(report);
  });

  test('Short weather report get by location name', () async {
    final dio = Dio(
      BaseOptions(baseUrl: 'https://weatherapi-com.p.rapidapi.com'),
    );
    final repository = WeatherReportRepository(dio);
    final report =
        await repository.getShortWeatherReportByLocationName('London');
    print(report);
  });
}
