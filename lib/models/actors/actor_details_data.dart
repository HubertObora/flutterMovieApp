// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'actor_details_data.g.dart';

@JsonSerializable()
class ActorDetailsData {
  final int id;
  final String name;
  final String? birthday;
  final String? profile_path;
  final String biography;
  final String? place_of_birth;
  final double popularity;

  ActorDetailsData({
    required this.id,
    required this.name,
    required this.birthday,
    required this.profile_path,
    required this.biography,
    required this.place_of_birth,
    required this.popularity,
  });

  factory ActorDetailsData.fromJson(Map<String, dynamic> json) =>
      _$ActorDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$ActorDetailsDataToJson(this);
}
