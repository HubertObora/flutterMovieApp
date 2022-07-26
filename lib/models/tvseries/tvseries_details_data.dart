// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp/models/movies/film_genres.dart';
import 'package:movieapp/models/tvseries/tvseries_seasons.dart';

import '../movies/production_countries.dart';

part 'tvseries_details_data.g.dart';

@JsonSerializable()
class TvseriesDetailsData {
  final int id;
  final String name;
  final String? backdrop_path;
  final String? poster_path;
  final List<FilmGenres> genres;
  final String overview;
  final double vote_average;
  final List<Seasons> seasons;
  final List<ProductionCountries> production_countries;

  TvseriesDetailsData({
    required this.id,
    required this.name,
    required this.backdrop_path,
    required this.poster_path,
    required this.genres,
    required this.overview,
    required this.vote_average,
    required this.seasons,
    required this.production_countries,
  });

  factory TvseriesDetailsData.fromJson(Map<String, dynamic> json) =>
      _$TvseriesDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$TvseriesDetailsDataToJson(this);
}
