import 'package:json_annotation/json_annotation.dart';

part 'timezone_user.g.dart';

@JsonSerializable(nullable: false)
class TimezoneUser {
  TimezoneUser({
    this.offset,
    this.description,
  });

  final String offset;
  final String description;

  // ignore: sort_constructors_first
  factory TimezoneUser.fromJson(Map<String, dynamic> json) =>
      _$TimezoneUserFromJson(json);
  Map<String, dynamic> toJson() => _$TimezoneUserToJson(this);
}
