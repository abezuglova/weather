part of 'locations_weather_cubit.dart';

@immutable
abstract class LocationsWeatherState {
  const LocationsWeatherState();
}

class LocationsWeatherLoadInProgress extends LocationsWeatherState {
  const LocationsWeatherLoadInProgress();
}

class LocationsWeatherLoadSuccess extends LocationsWeatherState {
  final List<ShortWeatherReport> shortWeatherReports;

  const LocationsWeatherLoadSuccess(this.shortWeatherReports);
}

class LocationsWeatherLoadFailure extends LocationsWeatherState {
  const LocationsWeatherLoadFailure();
}
