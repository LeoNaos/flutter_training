// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NameUser _$NameUserFromJson(Map<String, dynamic> json) {
  return NameUser(
    title: json['title'] as String,
    first: json['first'] as String,
    last: json['last'] as String,
  );
}

Map<String, dynamic> _$NameUserToJson(NameUser instance) => <String, dynamic>{
      'title': instance.title,
      'first': instance.first,
      'last': instance.last,
    };
