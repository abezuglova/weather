import 'package:weather_app/models/location.dart';

abstract class ILocationRepository {
  Future<List<Location>> getLocationsByName(String locationName);

  Future<List<Location>> getSavedLocations(String locationName);
}