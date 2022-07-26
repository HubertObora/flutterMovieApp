// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp/models/movies/film_genres.dart';
import 'package:movieapp/models/movies/production_countries.dart';

part 'film_details_data.g.dart';

@JsonSerializable()
class FilmDetailsData {
  final int id;
  final String title;
  final String? backdrop_path;
  final String? poster_path;
  final List<FilmGenres> genres;
  final String overview;
  final String release_date;
  final double vote_average;
  final List<ProductionCountries> production_countries;

  FilmDetailsData({
    required this.id,
    required this.title,
    required this.backdrop_path,
    required this.poster_path,
    required this.genres,
    required this.overview,
    required this.release_date,
    required this.vote_average,
    required this.production_countries,
  });

  factory FilmDetailsData.fromJson(Map<String, dynamic> json) =>
      _$FilmDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$FilmDetailsDataToJson(this);
}
