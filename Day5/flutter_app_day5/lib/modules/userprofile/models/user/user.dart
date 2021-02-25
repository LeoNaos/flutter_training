import 'package:flutter_app_day3/modules/userprofile/models/user/result_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(nullable: false)
class User {
  User({
    this.results,
  });

  @JsonKey(name: 'results', includeIfNull: false)
  final List<ResultUser> results;

  // ignore: sort_constructors_first
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
