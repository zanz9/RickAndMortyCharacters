import 'package:kdigital_test/src/features/character/domain/enitity/character_entity.dart';

abstract class ICharactersRepository {
  Future<List<CharacterEntity>> getAllCharacters(int page);
}
