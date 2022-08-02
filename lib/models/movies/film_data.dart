import 'package:json_annotation/json_annotation.dart';

part 'film_data.g.dart';

@JsonSerializable()
class FilmData {
  final int id;
  @JsonKey(name: 'title')
  final String? name;
  @JsonKey(name: 'poster_path')
  final String? poster;

  FilmData({
    required this.id,
    required this.name,
    required this.poster,
  });

  factory FilmData.fromJson(Map<String, dynamic> json) =>
      _$FilmDataFromJson(json);

  Map<String, dynamic> toJson() => _$FilmDataToJson(this);
}
