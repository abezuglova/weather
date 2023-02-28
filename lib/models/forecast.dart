import 'package:weather_app/models/current_hour_weather.dart';

class Forecast {
  final List<ForecastDay> daysForecast;

  Forecast(this.daysForecast);
}

class ForecastDay {
  final DateTime date;
  final int dateEpoch;
  final DayWeather day;
  final Astro astro;
  final List<CurrentHourWeather> hours;

  ForecastDay({
    required this.date,
    required this.dateEpoch,
    required this.day,
    required this.astro,
    required this.hours,
  });
}

class DayWeather {
  final double maxtempC;
  final double mintempC;
  final double maxwindMph;
  final int dailyChanceOfRain;
  final int dailyChanceOfSnow;
  final String text;
  final String icon;

  DayWeather({
    required this.maxtempC,
    required this.mintempC,
    required this.maxwindMph,
    required this.dailyChanceOfRain,
    required this.dailyChanceOfSnow,
    required this.text,
    required this.icon,
  });
}

class Astro {
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  final String moonPhase;
  final String moonIllumination;
  final int isMoonUp;
  final int isSunUp;

  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
    required this.isMoonUp,
    required this.isSunUp,
});
}
