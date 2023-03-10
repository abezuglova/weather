import 'package:flutter/material.dart';
import 'package:weather_app/pages/forecast_page/forecast_page.dart';
import 'package:weather_app/pages/locations_weather_page/locations_weather_page.dart';

class AppRoutes {
  static const forecastPageRoute = '/forecast_page';
  static const locationsWeatherPageRoute = '/locations_weather_page';
  static final routes = {
    locationsWeatherPageRoute: (context) => const LocationsWeatherPage(),
    forecastPageRoute: (context) {
      final name = ModalRoute.of(context)!.settings.arguments as String;
      return ForecastPage(locationName: name);
    },
  };
  static const initialRoute = locationsWeatherPageRoute;
}
