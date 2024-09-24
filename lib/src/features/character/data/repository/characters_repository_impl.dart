import 'dart:async';

import 'package:kdigital_test/src/features/character/data/data_sources/remote/character_remote_impl.dart';
import 'package:kdigital_test/src/features/character/domain/enitity/character_entity.dart';
import 'package:kdigital_test/src/features/character/domain/repository/i_characters_repository.dart';

class CharactersRepositoryImpl implements ICharactersRepository {
  CharactersRepositoryImpl();
  final CharacterRemoteImpl _characterRemoteImpl = CharacterRemoteImpl();

  @override
  Future<List<CharacterEntity>> getAllCharacters(int page) async {
    await _characterRemoteImpl.getAllCharacters(page);
    return [];
  }
}
