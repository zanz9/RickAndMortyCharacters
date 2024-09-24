import 'package:kdigital_test/src/features/character/data/mappers/character/character_dto_to_entity_mapper.dart';
import 'package:kdigital_test/src/features/character/data/mappers/info/info_dto_to_entity_mapper.dart';
import 'package:kdigital_test/src/features/character/data/models/character_result_dto.dart';
import 'package:kdigital_test/src/features/character/domain/enitity/character_result_entity.dart';

class CharacterResultDtoToEntityMapper {
  static CharacterResultEntity map(CharacterResultDto dto) {
    return CharacterResultEntity(
      info: InfoDtoToEntityMapper.map(dto.info),
      characters: dto.characters
          .map((character) => CharacterDtoToEntityMapper.map(character))
          .toList(),
    );
  }
}
