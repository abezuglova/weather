import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_report.dart';

class WeatherReportRepository {
  final Dio dio;

  WeatherReportRepository(this.dio);

  Future<WeatherReport> getWeatherReportByLocationName(String locationName) async {
    final response = await dio.get<Map<String, dynamic>>(
      '/forecast.json',
      queryParameters: {
        'q': locationName,
        'days': 3,
      },
      options: Options(
        headers: {
          'X-RapidAPI-Key':
              'ef65eafdfemsh3143e8603dff441p12aa6ejsn988491496ee1',
          'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com'
        },
      ),
    );
    return WeatherReport.fromJson(response.data!);
  }
}
