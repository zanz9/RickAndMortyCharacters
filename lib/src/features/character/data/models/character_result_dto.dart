import 'package:json_annotation/json_annotation.dart';
import 'package:kdigital_test/src/features/character/data/models/character_dto.dart';
import 'package:kdigital_test/src/features/character/data/models/info_dto.dart';

part 'character_result_dto.g.dart';

@JsonSerializable()
class CharacterResultDto {
  @JsonKey(name: 'info')
  final InfoDto info;
  @JsonKey(name: 'results')
  final List<CharacterDto> characters;

  CharacterResultDto({required this.info, required this.characters});

  factory CharacterResultDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterResultDtoFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterResultDtoToJson(this);
}
