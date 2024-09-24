import 'package:dio/dio.dart';
import 'package:kdigital_test/src/core/di/di_init.dart';
import 'package:kdigital_test/src/core/http/client/dio_client.dart';
import 'package:kdigital_test/src/core/http/endpoints.dart';
import 'package:kdigital_test/src/features/character/data/models/character_dto.dart';

class CharacterRemoteImpl {
  final Dio dio = getIt.get<DioClient>().dio;

  Future<List<CharacterDto>> getAllCharacters(int page) async {
    final response = await dio.get('${EndPoints.characters}?page=$page');
    if (response.statusCode != 200) {
      throw Exception('Failed to load characters');
    }
    final result = response.data['result'] as List;
    return result.map((e) => CharacterDto.fromJson(e)).toList();
  }
}
