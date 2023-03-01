import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_report.dart';
import 'package:weather_app/repository/weather_report_repository.dart';

part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  final WeatherReportRepository weatherReportRepository;
  ForecastCubit(this.weatherReportRepository)
      : super(const ForecastLoadInProgress());

  Future<void> onPageOpened(String locationName) async {
    try {
      final weatherReport = await weatherReportRepository
          .getWeatherReportByLocationName(locationName);
      emit(ForecastLoadSuccess(weatherReport));
    } catch (error, stackTrace) {
      log(
        'Error during weather report loading',
        error: error,
        stackTrace: stackTrace,
      );
      emit(const ForecastLoadFailure());
    }
  }
}
