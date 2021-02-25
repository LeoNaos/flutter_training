import 'package:flutter_app_day3/modules/userprofile/models/user/street_user.dart';
import 'package:flutter_app_day3/modules/userprofile/models/user/timezone_user.dart';
import 'package:json_annotation/json_annotation.dart';

import 'coordinates_user.dart';

part 'location_user.g.dart';

@JsonSerializable(nullable: false)
class LocationUser {
  LocationUser({
    this.street,
    this.city,
    this.state,
    this.country,
    // this.postcode,
    this.coordinates,
    this.timezone,
  });

  @JsonKey(name: 'street', includeIfNull: false)
  final StreetUser street;
  final String city;
  final String state;
  final String country;
  // final int postcode;
  @JsonKey(name: 'coordinates', includeIfNull: false)
  final CoordinatesUser coordinates;
  @JsonKey(name: 'timezone', includeIfNull: false)
  final TimezoneUser timezone;

  // ignore: sort_constructors_first
  factory LocationUser.fromJson(Map<String, dynamic> json) =>
      _$LocationUserFromJson(json);
  Map<String, dynamic> toJson() => _$LocationUserToJson(this);
}
