import 'package:weather_app/models/current_hour_weather.dart';

class Forecast {
  final List<ForecastDay> daysForecast;

  Forecast({required this.daysForecast});

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
        daysForecast: (json['forecastday'] as List<dynamic>)
            .map((json) => ForecastDay.fromJson(json))
            .toList(),
      );
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

  factory ForecastDay.fromJson(Map<String, dynamic> json) => ForecastDay(
        date: DateTime.parse(json['date']),
        dateEpoch: json['date_epoch'],
        day: DayWeather.fromJson(json['day']),
        astro: Astro.fromJson(json['astro']),
        hours: (json['hour'] as List<dynamic>)
            .map((json) => CurrentHourWeather.fromJson(json))
            .toList(),
      );
}

class DayWeather {
  final double maxtempC;
  final double mintempC;
  final double maxwindMph;
  final int dailyChanceOfRain;
  final int dailyChanceOfSnow;
  final Condition condition;

  DayWeather({
    required this.maxtempC,
    required this.mintempC,
    required this.maxwindMph,
    required this.dailyChanceOfRain,
    required this.dailyChanceOfSnow,
    required this.condition, 
  });

  factory DayWeather.fromJson(Map<String, dynamic> json) => DayWeather(
        maxtempC: json['maxtemp_c'],
        mintempC: json['mintemp_c'],
        maxwindMph: json['maxwind_mph'],
        dailyChanceOfRain: json['daily_chance_of_rain'],
        dailyChanceOfSnow: json['daily_chance_of_snow'],
        condition: Condition.fromJson(json['condition']),
      );
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

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
        sunrise: json['sunrise'],
        sunset: json['sunset'],
        moonrise: json['moonrise'],
        moonset: json['moonset'],
        moonPhase: json['moon_phase'],
        moonIllumination: json['moon_illumination'],
        isMoonUp: json['is_moon_up'],
        isSunUp: json['is_sun_up'],
      );
}
