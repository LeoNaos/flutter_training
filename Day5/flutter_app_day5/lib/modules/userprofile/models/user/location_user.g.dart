// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationUser _$LocationUserFromJson(Map<String, dynamic> json) {
  return LocationUser(
    street: StreetUser.fromJson(json['street'] as Map<String, dynamic>),
    city: json['city'] as String,
    state: json['state'] as String,
    country: json['country'] as String,
    coordinates:
        CoordinatesUser.fromJson(json['coordinates'] as Map<String, dynamic>),
    timezone: TimezoneUser.fromJson(json['timezone'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LocationUserToJson(LocationUser instance) =>
    <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'coordinates': instance.coordinates,
      'timezone': instance.timezone,
    };
