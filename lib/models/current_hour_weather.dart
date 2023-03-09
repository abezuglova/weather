class CurrentHourWeather {
  final DateTime time;
  final double tempC;
  final int isDay;
  final double windMph;
  final String windDir;
  final double feelslikeC;
  final Condition condition;

  CurrentHourWeather({
    required this.time,
    required this.tempC,
    required this.isDay,
    required this.windMph,
    required this.windDir,
    required this.feelslikeC,
    required this.condition,
  });

  factory CurrentHourWeather.fromJson(Map<String, dynamic> json) =>
      CurrentHourWeather(
        time: DateTime.parse(json['time']),
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
  final String iconUrl;

  Condition({
    required this.text,
    required this.iconUrl,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        text: json['text'],
        iconUrl: 'https:${json['icon']}',
      );
}
