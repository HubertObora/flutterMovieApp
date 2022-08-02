import 'package:json_annotation/json_annotation.dart';

part 'tvseries_data.g.dart';

@JsonSerializable()
class TvseriesData {
  final int id;
  final String? name;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPoster;
  @JsonKey(name: 'poster_path')
  final String? poster;

  TvseriesData({
    required this.id,
    required this.name,
    required this.backdropPoster,
    required this.poster,
  });

  factory TvseriesData.fromJson(Map<String, dynamic> json) =>
      _$TvseriesDataFromJson(json);

  Map<String, dynamic> toJson() => _$TvseriesDataToJson(this);
}
