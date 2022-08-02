import 'package:json_annotation/json_annotation.dart';

part 'actor_data.g.dart';

@JsonSerializable()
class ActorData {
  final int id;
  final String? name;
  @JsonKey(name: 'profile_path')
  final String? poster;

  ActorData({
    required this.id,
    required this.name,
    required this.poster,
  });

  factory ActorData.fromJson(Map<String, dynamic> json) =>
      _$ActorDataFromJson(json);

  Map<String, dynamic> toJson() => _$ActorDataToJson(this);
}
