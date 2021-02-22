import 'package:json_annotation/json_annotation.dart';

part 'street_user.g.dart';

@JsonSerializable(nullable: false)
class StreetUser {
  StreetUser({
    this.number,
    this.name,
  });

  final int number;
  final String name;

  // ignore: sort_constructors_first
  factory StreetUser.fromJson(Map<String, dynamic> json) =>
      _$StreetUserFromJson(json);
  Map<String, dynamic> toJson() => _$StreetUserToJson(this);
}
