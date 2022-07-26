// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActorData _$ActorDataFromJson(Map<String, dynamic> json) => ActorData(
      id: json['id'] as int,
      name: json['name'] as String,
      profile_path: json['profile_path'] as String?,
    );

Map<String, dynamic> _$ActorDataToJson(ActorData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.profile_path,
    };
