// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'production_countries.g.dart';

@JsonSerializable()
class ProductionCountries {
  final String iso_3166_1;
  final String? name;

  ProductionCountries({
    required this.iso_3166_1,
    required this.name,
  });

  factory ProductionCountries.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountriesFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountriesToJson(this);
}
