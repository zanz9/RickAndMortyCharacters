import 'package:kdigital_test/src/features/character/data/models/info_dto.dart';
import 'package:kdigital_test/src/features/character/domain/enitity/info_entity.dart';

class InfoDtoToEntityMapper {
  static InfoEntity map(InfoDto dto) {
    return InfoEntity(
      count: dto.count,
      pages: dto.pages,
      next: dto.next,
      prev: dto.prev,
    );
  }
}
