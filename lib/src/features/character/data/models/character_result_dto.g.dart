// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterResultDto _$CharacterResultDtoFromJson(Map<String, dynamic> json) =>
    CharacterResultDto(
      info: InfoDto.fromJson(json['info'] as Map<String, dynamic>),
      characters: (json['results'] as List<dynamic>)
          .map((e) => CharacterDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterResultDtoToJson(CharacterResultDto instance) =>
    <String, dynamic>{
      'info': instance.info,
      'results': instance.characters,
    };
