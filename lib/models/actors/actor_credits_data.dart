import 'package:json_annotation/json_annotation.dart';

part 'actor_credits_data.g.dart';

@JsonSerializable()
class ActorCreditsData {
  final int id;
  final String? title;
  final String? name;
  @JsonKey(name: 'poster_path')
  final String? posterPath;

  ActorCreditsData({
    required this.id,
    required this.title,
    required this.name,
    required this.posterPath,
  });

  factory ActorCreditsData.fromJson(Map<String, dynamic> json) =>
      _$ActorCreditsDataFromJson(json);

  Map<String, dynamic> toJson() => _$ActorCreditsDataToJson(this);
}
