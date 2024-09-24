import 'package:kdigital_test/src/features/character/domain/enitity/character_result_entity.dart';

abstract class ICharactersRepository {
  Future<CharacterResultEntity> getAllCharacters(int page);
}
