// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'film_genres.g.dart';

@JsonSerializable()
class FilmGenres {
  final int id;
  final String? name;

  FilmGenres({
    required this.id,
    required this.name,
  });

  factory FilmGenres.fromJson(Map<String, dynamic> json) =>
      _$FilmGenresFromJson(json);

  Map<String, dynamic> toJson() => _$FilmGenresToJson(this);
}
