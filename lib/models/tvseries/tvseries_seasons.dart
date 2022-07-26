// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'tvseries_seasons.g.dart';

@JsonSerializable()
class Seasons {
  final int id;
  final String? air_date;

  Seasons({
    required this.id,
    required this.air_date,
  });

  factory Seasons.fromJson(Map<String, dynamic> json) =>
      _$SeasonsFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonsToJson(this);
}
