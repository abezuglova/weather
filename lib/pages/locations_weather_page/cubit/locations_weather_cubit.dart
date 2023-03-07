import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/i_repository/i_weather_report_repository.dart';
import 'package:weather_app/models/short_weather_report.dart';

part 'locations_weather_state.dart';

class LocationsWeatherCubit extends Cubit<LocationsWeatherState> {
  final IWeatherReportRepository weatherReportRepository;
  LocationsWeatherCubit(this.weatherReportRepository)
      : super(const LocationsWeatherLoadInProgress());

  Future<void> onPageOpened(List<String> locationNames) async {
    try {
      final shortWeatherReports = await weatherReportRepository
          .getShortWeatherReportListByLocationNames(locationNames);
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
