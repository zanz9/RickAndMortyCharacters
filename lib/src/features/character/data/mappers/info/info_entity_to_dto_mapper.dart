import 'package:kdigital_test/src/features/character/data/models/info_dto.dart';
import 'package:kdigital_test/src/features/character/domain/enitity/info_entity.dart';

class InfoEntityToDtoMapper {
  static InfoDto toDto(InfoEntity entity) {
    return InfoDto(
      count: entity.count,
      pages: entity.pages,
      next: entity.next,
      prev: entity.prev,
    );
  }
}
