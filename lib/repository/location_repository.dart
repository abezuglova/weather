import 'package:dio/dio.dart';
import 'package:weather_app/i_repository/i_location_repository.dart';
import 'package:weather_app/models/location.dart';

class LocationRepository implements ILocationRepository {
  final Dio dio;

  LocationRepository(this.dio);

  @override
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

  @override
  Future<List<Location>> getSavedLocations() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Location(
          name: 'Rostov-Na-Donu', region: 'Rostov', country: 'Russia', latitude: 47.24, longitude: 39.71),
      Location(
          name: 'Eupatoria', region: 'Krym', country: 'Ukraine', latitude: 45.2, longitude: 33.36),
      Location(
          name: 'Novocherkassk', region: 'Rostov', country: 'Russia', latitude: 47.42, longitude: 40.09),
    ];
  }
}
