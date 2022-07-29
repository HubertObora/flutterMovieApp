import 'package:json_annotation/json_annotation.dart';
import 'package:movieapp/models/movies/film_genres.dart';
import 'package:movieapp/models/tvseries/tvseries_seasons.dart';

import '../movies/production_countries.dart';

part 'tvseries_details_data.g.dart';

@JsonSerializable()
class TvseriesDetailsData {
  final int id;
  final String name;
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;
  @JsonKey(name: 'poster_path')
  final String? posterPath;
  final List<FilmGenres> genres;
  final String overview;
  @JsonKey(name: 'vote_average')
  final double voteAverage;
  final List<Seasons> seasons;
  @JsonKey(name: 'production_countries')
  final List<ProductionCountries> productionCountries;

  TvseriesDetailsData({
    required this.id,
    required this.name,
    required this.backdropPath,
    required this.posterPath,
    required this.genres,
    required this.overview,
    required this.voteAverage,
    required this.seasons,
    required this.productionCountries,
  });

  factory TvseriesDetailsData.fromJson(Map<String, dynamic> json) =>
      _$TvseriesDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$TvseriesDetailsDataToJson(this);
}
