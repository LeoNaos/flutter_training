// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timezone_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimezoneUser _$TimezoneUserFromJson(Map<String, dynamic> json) {
  return TimezoneUser(
    offset: json['offset'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$TimezoneUserToJson(TimezoneUser instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'description': instance.description,
    };
