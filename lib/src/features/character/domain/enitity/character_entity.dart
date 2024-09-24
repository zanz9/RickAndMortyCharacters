import 'package:json_annotation/json_annotation.dart';

part 'character_entity.g.dart';

@JsonSerializable()
class CharacterEntity {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Map<String, String> origin;
  final Map<String, String> location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  CharacterEntity({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory CharacterEntity.fromJson(Map<String, dynamic> json) =>
      _$CharacterEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterEntityToJson(this);
}
