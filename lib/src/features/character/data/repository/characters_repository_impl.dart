import 'dart:async';

import 'package:kdigital_test/src/features/character/data/data_sources/remote/character_remote_impl.dart';
import 'package:kdigital_test/src/features/character/data/mappers/character_result/character_result_dto_to_entity_mapper.dart';
import 'package:kdigital_test/src/features/character/data/models/character_result_dto.dart';
import 'package:kdigital_test/src/features/character/domain/enitity/character_result_entity.dart';
import 'package:kdigital_test/src/features/character/domain/repository/i_characters_repository.dart';

class CharactersRepositoryImpl implements ICharactersRepository {
  CharactersRepositoryImpl();
  final CharacterRemoteImpl _characterRemoteImpl = CharacterRemoteImpl();

  @override
  Future<CharacterResultEntity> getAllCharacters(int page) async {
    final CharacterResultDto result =
        await _characterRemoteImpl.getAllCharacters(page);

    final CharacterResultEntity characters =
        CharacterResultDtoToEntityMapper.map(result);
    return characters;
  }
}
