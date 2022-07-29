// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tvseries_details_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvseriesDetailsData _$TvseriesDetailsDataFromJson(Map<String, dynamic> json) =>
    TvseriesDetailsData(
      id: json['id'] as int,
      name: json['name'] as String,
      backdropPath: json['backdrop_path'] as String?,
      posterPath: json['poster_path'] as String?,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => FilmGenres.fromJson(e as Map<String, dynamic>))
          .toList(),
      overview: json['overview'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      seasons: (json['seasons'] as List<dynamic>)
          .map((e) => Seasons.fromJson(e as Map<String, dynamic>))
          .toList(),
      productionCountries: (json['production_countries'] as List<dynamic>)
          .map((e) => ProductionCountries.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TvseriesDetailsDataToJson(
        TvseriesDetailsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'genres': instance.genres,
      'overview': instance.overview,
      'vote_average': instance.voteAverage,
      'seasons': instance.seasons,
      'production_countries': instance.productionCountries,
    };
