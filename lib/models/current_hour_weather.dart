class CurrentHourWeather {
  final int lastUpdatedEpoch;
  final String lastUpdated;
  final double tempC;
  final int isDay;
  final Condition condition;

  CurrentHourWeather({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.isDay,
    required this.condition,
  });
}

class Condition {
  final double windMph;
  final String windDir;
  final double feelslikeC;
  final double feelslikeF;

  Condition({
    required this.windMph,
    required this.windDir,
    required this.feelslikeC,
    required this.feelslikeF,
  });
}
