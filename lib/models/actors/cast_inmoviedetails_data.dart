import 'package:json_annotation/json_annotation.dart';

part 'cast_inmoviedetails_data.g.dart';

@JsonSerializable()
class CastInMovieDetailsData {
  final int id;
  final String name;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  final String character;

  CastInMovieDetailsData({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.character,
  });

  factory CastInMovieDetailsData.fromJson(Map<String, dynamic> json) =>
      _$CastInMovieDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$CastInMovieDetailsDataToJson(this);
}
