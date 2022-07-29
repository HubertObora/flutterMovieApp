import 'package:json_annotation/json_annotation.dart';

part 'crew_inmoviedetails_data.g.dart';

@JsonSerializable()
class CrewInMovieDetailsData {
  final int id;
  final String name;
  @JsonKey(name: 'profile_path')
  final String? profilePath;
  final String department;

  CrewInMovieDetailsData({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.department,
  });

  factory CrewInMovieDetailsData.fromJson(Map<String, dynamic> json) =>
      _$CrewInMovieDetailsDataFromJson(json);

  Map<String, dynamic> toJson() => _$CrewInMovieDetailsDataToJson(this);
}
