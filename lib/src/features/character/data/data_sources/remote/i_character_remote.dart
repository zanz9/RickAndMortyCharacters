import 'package:kdigital_test/src/features/character/data/models/character_result_dto.dart';

abstract class ICharacterRemote {
  Future<CharacterResultDto> getAllCharacters(int page);
}
