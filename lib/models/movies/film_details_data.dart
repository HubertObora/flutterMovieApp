import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp/models/movies/film_genres.dart';
import 'package:movieapp/models/movies/production_countries.dart';

part 'film_details_data.g.dart';

@JsonSerializable()
class FilmDetailsData {
  final int id;
  final String title;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  final List<FilmGenres> genres;
  final String overview;
  @JsonKey(name: 'release_date')
  final String releaseDate;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  @JsonKey(name: 'production_countries')
  final List<ProductionCountries> productionCountries;

  FilmDetailsData({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.posterPath,
    required this.genres,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.productionCountries,
  });

  factory FilmDetailsData.fromJson(Map<String, dynamic> json) =>
      _$FilmDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$FilmDetailsDataToJson(this);
}
