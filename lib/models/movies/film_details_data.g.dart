// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_details_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmDetailsData _$FilmDetailsDataFromJson(Map<String, dynamic> json) =>
    FilmDetailsData(
      id: json['id'] as int,
      title: json['title'] as String,
      backdropPath: json['backdrop_path'] as String?,
      posterPath: json['poster_path'] as String?,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => FilmGenres.fromJson(e as Map<String, dynamic>))
          .toList(),
      overview: json['overview'] as String,
      releaseDate: json['release_date'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      productionCountries: (json['production_countries'] as List<dynamic>)
          .map((e) => ProductionCountries.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilmDetailsDataToJson(FilmDetailsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'backdrop_path': instance.backdropPath,
      'poster_path': instance.posterPath,
      'genres': instance.genres,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
      'production_countries': instance.productionCountries,
    };
