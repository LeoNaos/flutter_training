import 'package:json_annotation/json_annotation.dart';

part 'name_user.g.dart';

@JsonSerializable(nullable: false)
class NameUser {
  NameUser({
    this.title,
    this.first,
    this.last,
  });

  @JsonKey(name: 'title', includeIfNull: false)
  final String title;
  final String first;
  final String last;

  // ignore: sort_constructors_first
  factory NameUser.fromJson(Map<String, dynamic> json) =>
      _$NameUserFromJson(json);
  Map<String, dynamic> toJson() => _$NameUserToJson(this);
}
