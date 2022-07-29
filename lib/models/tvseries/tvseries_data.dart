import 'package:json_annotation/json_annotation.dart';

part 'tvseries_data.g.dart';

@JsonSerializable()
class TvseriesData {
  final int id;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  TvseriesData({
    required this.id,
    required this.backdropPath,
  });

  factory TvseriesData.fromJson(Map<String, dynamic> json) =>
      _$TvseriesDataFromJson(json);

  Map<String, dynamic> toJson() => _$TvseriesDataToJson(this);
}
