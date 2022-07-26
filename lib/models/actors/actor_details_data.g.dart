// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_details_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorDetailsData _$ActorDetailsDataFromJson(Map<String, dynamic> json) =>
    ActorDetailsData(
      id: json['id'] as int,
      name: json['name'] as String,
      birthday: json['birthday'] as String?,
      profile_path: json['profile_path'] as String?,
      biography: json['biography'] as String,
      place_of_birth: json['place_of_birth'] as String?,
      popularity: (json['popularity'] as num).toDouble(),
    );

Map<String, dynamic> _$ActorDetailsDataToJson(ActorDetailsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'birthday': instance.birthday,
      'profile_path': instance.profile_path,
      'biography': instance.biography,
      'place_of_birth': instance.place_of_birth,
      'popularity': instance.popularity,
    };
