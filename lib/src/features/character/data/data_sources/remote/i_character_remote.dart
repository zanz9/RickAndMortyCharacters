import 'package:kdigital_test/src/features/character/data/models/character_dto.dart';

abstract class ICharacterRemote {
  Future<List<CharacterDto>> getAllCharacters(int page);
}
