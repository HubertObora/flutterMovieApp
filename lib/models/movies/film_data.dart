// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'film_data.g.dart';

@JsonSerializable()
class FilmData {
  final int id;
  final String? poster_path;

  FilmData({
    required this.id,
    required this.poster_path,
  });

  factory FilmData.fromJson(Map<String, dynamic> json) =>
      _$FilmDataFromJson(json);

  Map<String, dynamic> toJson() => _$FilmDataToJson(this);
}
