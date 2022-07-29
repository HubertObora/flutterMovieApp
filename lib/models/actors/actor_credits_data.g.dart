// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_credits_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorCreditsData _$ActorCreditsDataFromJson(Map<String, dynamic> json) =>
    ActorCreditsData(
      id: json['id'] as int,
      title: json['title'] as String?,
      name: json['name'] as String?,
      posterPath: json['poster_path'] as String?,
    );

Map<String, dynamic> _$ActorCreditsDataToJson(ActorCreditsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'name': instance.name,
      'poster_path': instance.posterPath,
    };
