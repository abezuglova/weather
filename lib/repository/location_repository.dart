import 'package:dio/dio.dart';
import 'package:weather_app/models/location.dart';

class LocationRepository {
  final Dio dio;

  LocationRepository(this.dio);

  Future<List<Location>> getLocationsByName(String locationName) async {
    final response = await dio.get<List<dynamic>>(
      '/search.json',
      queryParameters: {
        'q': locationName,
      },
      options: Options(
        headers: {
          'X-RapidAPI-Key':
              'ef65eafdfemsh3143e8603dff441p12aa6ejsn988491496ee1',
          'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com'
        },
      ),
    );
    return response.data!.map((json) => Location.fromJson(json)).toList();
  }
}
