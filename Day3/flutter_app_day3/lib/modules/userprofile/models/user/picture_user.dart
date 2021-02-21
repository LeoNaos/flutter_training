import 'package:json_annotation/json_annotation.dart';

part 'picture_user.g.dart';

@JsonSerializable(nullable: false)
class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  // ignore: sort_constructors_first
  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  // ignore: sort_constructors_first
  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);
  Map<String, dynamic> toJson() => _$PictureToJson(this);
}
