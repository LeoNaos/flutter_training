// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coordinates_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoordinatesUser _$CoordinatesUserFromJson(Map<String, dynamic> json) {
  return CoordinatesUser(
    latitude: json['latitude'] as String,
    longitude: json['longitude'] as String,
  );
}

Map<String, dynamic> _$CoordinatesUserToJson(CoordinatesUser instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
