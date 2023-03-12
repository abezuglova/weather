import 'package:json_annotation/json_annotation.dart';
part 'location.g.dart';

@JsonSerializable(createToJson: false)
class Location {
  final String name;
  final String region;
  final String country;
  @JsonKey(name: 'lat')
  final double latitude;
  @JsonKey(name: 'lon')
  final double longitude;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
