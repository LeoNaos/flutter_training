import 'package:json_annotation/json_annotation.dart';

part 'coordinates_user.g.dart';

@JsonSerializable(nullable: false)
class CoordinatesUser {
  CoordinatesUser({
    this.latitude,
    this.longitude,
  });

  @JsonKey(name: 'latitude', includeIfNull: false)
  final String latitude;
  final String longitude;

  // ignore: sort_constructors_first
  factory CoordinatesUser.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesUserFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesUserToJson(this);
}
