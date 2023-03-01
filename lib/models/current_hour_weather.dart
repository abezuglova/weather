class CurrentHourWeather {
  final double tempC;
  final int isDay;
  final double windMph;
  final String windDir;
  final double feelslikeC;
  final Condition condition;

  CurrentHourWeather({
    required this.tempC,
    required this.isDay,
    required this.windMph,
    required this.windDir,
    required this.feelslikeC,
    required this.condition,
  });

  factory CurrentHourWeather.fromJson(Map<String, dynamic> json) =>
      CurrentHourWeather(
        tempC: json['temp_c'],
        isDay: json['is_day'],
        windMph: json['wind_mph'],
        windDir: json['wind_dir'],
        feelslikeC: json['feelslike_c'],
        condition: Condition.fromJson(json['condition']),
      );
}

class Condition {
  final String text;
  final String icon;

  Condition({
    required this.text,
    required this.icon,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json['text'],
        icon: json['icon'],
      );
}
