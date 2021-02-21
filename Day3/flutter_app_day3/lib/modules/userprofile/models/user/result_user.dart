import 'package:flutter_app_day3/utils/string_utils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'location_user.dart';
import 'name_user.dart';
import 'picture_user.dart';

part 'result_user.g.dart';

@JsonSerializable(nullable: false)
class ResultUser {
  ResultUser({
    this.gender,
    this.name,
    this.location,
    this.email,
    this.phone,
    this.cell,
    this.picture,
    this.nat,
  });

  final String gender;
  final NameUser name;
  final LocationUser location;
  final String email;
  final String phone;
  final String cell;
  final Picture picture;
  final String nat;

  // ignore: sort_constructors_first
  factory ResultUser.fromJson(Map<String, dynamic> json) =>
      _$ResultUserFromJson(json);
  Map<String, dynamic> toJson() => _$ResultUserToJson(this);

  String fullName() {
    return SUtils.capitalize(name.first) + ' ' + SUtils.capitalize(name.last);
  }
}
