import 'package:kdigital_test/src/features/character/data/mappers/character/character_entity_to_dto_mapper.dart';
import 'package:kdigital_test/src/features/character/data/mappers/info/info_entity_to_dto_mapper.dart';
import 'package:kdigital_test/src/features/character/data/models/character_result_dto.dart';
import 'package:kdigital_test/src/features/character/domain/enitity/character_result_entity.dart';

class CharacterResultEntityToDtoMapper {
  static CharacterResultDto toDto(CharacterResultEntity entity) {
    return CharacterResultDto(
      info: InfoEntityToDtoMapper.toDto(entity.info),
      characters: entity.characters
          .map((character) => CharacterEntityToDtoMapper.toDto(character))
          .toList(),
    );
  }
}
