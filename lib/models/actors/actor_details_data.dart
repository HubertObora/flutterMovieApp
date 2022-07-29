import 'package:json_annotation/json_annotation.dart';

part 'actor_details_data.g.dart';

@JsonSerializable()
class ActorDetailsData {
  final int id;
  final String name;
  final String? birthday;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  final String biography;
  @JsonKey(name: 'place_of_birth')
  final String? placeOfBirth;
  final double popularity;

  ActorDetailsData({
    required this.id,
    required this.name,
    required this.birthday,
    required this.profilePath,
    required this.biography,
    required this.placeOfBirth,
    required this.popularity,
  });

  factory ActorDetailsData.fromJson(Map<String, dynamic> json) =>
      _$ActorDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$ActorDetailsDataToJson(this);
}
