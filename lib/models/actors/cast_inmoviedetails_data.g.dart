// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_inmoviedetails_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastInMovieDetailsData _$CastInMovieDetailsDataFromJson(
        Map<String, dynamic> json) =>
    CastInMovieDetailsData(
      id: json['id'] as int,
      name: json['name'] as String,
      profilePath: json['profile_path'] as String?,
      character: json['character'] as String,
    );

Map<String, dynamic> _$CastInMovieDetailsDataToJson(
        CastInMovieDetailsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.profilePath,
      'character': instance.character,
    };
