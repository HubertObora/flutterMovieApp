// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_details_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmDetailsData _$FilmDetailsDataFromJson(Map<String, dynamic> json) =>
    FilmDetailsData(
      id: json['id'] as int,
      title: json['title'] as String,
      backdrop_path: json['backdrop_path'] as String?,
      poster_path: json['poster_path'] as String?,
      genres: (json['genres'] as List<dynamic>)
          .map((e) => FilmGenres.fromJson(e as Map<String, dynamic>))
          .toList(),
      overview: json['overview'] as String,
      release_date: json['release_date'] as String,
      vote_average: (json['vote_average'] as num).toDouble(),
      production_countries: (json['production_countries'] as List<dynamic>)
          .map((e) => ProductionCountries.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FilmDetailsDataToJson(FilmDetailsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'backdrop_path': instance.backdrop_path,
      'poster_path': instance.poster_path,
      'genres': instance.genres,
      'overview': instance.overview,
      'release_date': instance.release_date,
      'vote_average': instance.vote_average,
      'production_countries': instance.production_countries,
    };
