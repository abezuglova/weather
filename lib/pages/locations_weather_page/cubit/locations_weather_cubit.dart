import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/i_repository/i_location_repository.dart';
import 'package:weather_app/i_repository/i_weather_report_repository.dart';
import 'package:weather_app/models/short_weather_report.dart';

part 'locations_weather_state.dart';

class LocationsWeatherCubit extends Cubit<LocationsWeatherState> {
  final IWeatherReportRepository weatherReportRepository;
  final ILocationRepository locationRepository;
  LocationsWeatherCubit(
      {required this.weatherReportRepository, required this.locationRepository})
      : super(const LocationsWeatherLoadInProgress());

  Future<void> onPageOpened() async {
    try {
      final savedLocations = await locationRepository.getSavedLocations();
      final shortWeatherReports = await weatherReportRepository
          .getShortWeatherReportListByLocationNames(
              savedLocations.map((e) => e.name).toList());
      emit(LocationsWeatherLoadSuccess(shortWeatherReports));
    } catch (error, stackTrace) {
      log(
        'Error during weather report loading',
        error: error,
        stackTrace: stackTrace,
      );
      emit(const LocationsWeatherLoadFailure());
    }
  }
}
