// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tvseries_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TvseriesData _$TvseriesDataFromJson(Map<String, dynamic> json) => TvseriesData(
      id: json['id'] as int,
      name: json['name'] as String?,
      backdropPoster: json['backdrop_path'] as String?,
      poster: json['poster_path'] as String?,
    );

Map<String, dynamic> _$TvseriesDataToJson(TvseriesData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'backdrop_path': instance.backdropPoster,
      'poster_path': instance.poster,
    };
