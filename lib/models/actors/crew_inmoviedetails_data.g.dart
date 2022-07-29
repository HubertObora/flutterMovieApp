// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crew_inmoviedetails_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CrewInMovieDetailsData _$CrewInMovieDetailsDataFromJson(
        Map<String, dynamic> json) =>
    CrewInMovieDetailsData(
      id: json['id'] as int,
      name: json['name'] as String,
      profilePath: json['profile_path'] as String?,
      department: json['department'] as String,
    );

Map<String, dynamic> _$CrewInMovieDetailsDataToJson(
        CrewInMovieDetailsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'profile_path': instance.profilePath,
      'department': instance.department,
    };
