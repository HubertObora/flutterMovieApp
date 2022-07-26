// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'actor_data.g.dart';

@JsonSerializable()
class ActorData {
  final int id;
  final String name;
  final String? profile_path;

  ActorData({
    required this.id,
    required this.name,
    required this.profile_path,
  });

  factory ActorData.fromJson(Map<String, dynamic> json) =>
      _$ActorDataFromJson(json);

  Map<String, dynamic> toJson() => _$ActorDataToJson(this);
}
