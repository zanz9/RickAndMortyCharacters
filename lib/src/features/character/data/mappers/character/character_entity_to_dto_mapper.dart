import 'package:kdigital_test/src/features/character/data/models/character_dto.dart';
import 'package:kdigital_test/src/features/character/domain/enitity/character_entity.dart';

class CharacterEntityToDtoMapper {
  static CharacterDto toDto(CharacterEntity entity) {
    return CharacterDto(
      id: entity.id,
      name: entity.name,
      status: entity.status,
      species: entity.species,
      type: entity.type,
      gender: entity.gender,
      origin: entity.origin,
      location: entity.location,
      image: entity.image,
      episode: entity.episode,
      url: entity.url,
      created: entity.created,
    );
  }
}
