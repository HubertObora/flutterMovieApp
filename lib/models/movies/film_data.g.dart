// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilmData _$FilmDataFromJson(Map<String, dynamic> json) => FilmData(
      id: json['id'] as int,
      name: json['title'] as String?,
      poster: json['poster_path'] as String?,
    );

Map<String, dynamic> _$FilmDataToJson(FilmData instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.name,
      'poster_path': instance.poster,
    };
