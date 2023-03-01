part of 'forecast_cubit.dart';

@immutable
abstract class ForecastState {
  const ForecastState();
}

class ForecastLoadInProgress extends ForecastState {
  const ForecastLoadInProgress();
}

class ForecastLoadSuccess extends ForecastState {
  final WeatherReport weatherReport;

  const ForecastLoadSuccess(this.weatherReport);
}

class ForecastLoadFailure extends ForecastState {
  const ForecastLoadFailure();
}
