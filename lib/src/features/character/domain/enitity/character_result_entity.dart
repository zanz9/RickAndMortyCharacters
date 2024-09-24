import 'package:kdigital_test/src/features/character/domain/enitity/character_entity.dart';
import 'package:kdigital_test/src/features/character/domain/enitity/info_entity.dart';

class CharacterResultEntity {
  final List<CharacterEntity> characters;
  final InfoEntity info;

  CharacterResultEntity({required this.characters, required this.info});
}
