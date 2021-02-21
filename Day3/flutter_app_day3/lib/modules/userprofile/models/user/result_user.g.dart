// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResultUser _$ResultUserFromJson(Map<String, dynamic> json) {
  return ResultUser(
    gender: json['gender'] as String,
    name: NameUser.fromJson(json['name'] as Map<String, dynamic>),
    location: LocationUser.fromJson(json['location'] as Map<String, dynamic>),
    email: json['email'] as String,
    phone: json['phone'] as String,
    cell: json['cell'] as String,
    picture: Picture.fromJson(json['picture'] as Map<String, dynamic>),
    nat: json['nat'] as String,
  );
}

Map<String, dynamic> _$ResultUserToJson(ResultUser instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'name': instance.name,
      'location': instance.location,
      'email': instance.email,
      'phone': instance.phone,
      'cell': instance.cell,
      'picture': instance.picture,
      'nat': instance.nat,
    };
