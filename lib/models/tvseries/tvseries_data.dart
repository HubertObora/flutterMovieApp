// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'tvseries_data.g.dart';

@JsonSerializable()
class TvseriesData {
  final int id;
  final String? backdrop_path;

  TvseriesData({
    required this.id,
    required this.backdrop_path,
  });

  factory TvseriesData.fromJson(Map<String, dynamic> json) =>
      _$TvseriesDataFromJson(json);

  Map<String, dynamic> toJson() => _$TvseriesDataToJson(this);
}
