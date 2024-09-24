import 'package:kdigital_test/src/features/character/data/models/character_dto.dart';
import 'package:kdigital_test/src/features/character/domain/enitity/character_entity.dart';

class CharacterDtoToEntityMapper {
  static CharacterEntity map(CharacterDto dto) {
    return CharacterEntity(
      id: dto.id,
      name: dto.name,
      status: dto.status,
      species: dto.species,
      type: dto.type,
      gender: dto.gender,
      origin: dto.origin,
      location: dto.location,
      image: dto.image,
      episode: dto.episode,
      url: dto.url,
      created: dto.created,
    );
  }
}
