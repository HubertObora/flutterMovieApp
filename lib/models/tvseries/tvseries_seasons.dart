import 'package:json_annotation/json_annotation.dart';

part 'tvseries_seasons.g.dart';

@JsonSerializable()
class Seasons {
  final int id;
  @JsonKey(name: 'air_date')
  final String? airDate;

  Seasons({
    required this.id,
    required this.airDate,
  });

  factory Seasons.fromJson(Map<String, dynamic> json) =>
      _$SeasonsFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonsToJson(this);
}
