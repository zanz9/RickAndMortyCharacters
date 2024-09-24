import 'package:dio/dio.dart';
import 'package:kdigital_test/src/core/di/di_init.dart';
import 'package:kdigital_test/src/core/http/client/dio_client.dart';
import 'package:kdigital_test/src/core/http/endpoints.dart';
import 'package:kdigital_test/src/features/character/data/models/character_result_dto.dart';

class CharacterRemoteImpl {
  final Dio dio = getIt.get<DioClient>().dio;

  Future<CharacterResultDto?> getAllCharacters(int page) async {
    try {
      final response = await dio.get('${EndPoints.characters}?page=$page');
      if (response.statusCode != 200) {
        throw Exception('Failed to load characters');
      }
      final result = response.data;
      return CharacterResultDto.fromJson(result);
    } catch (e) {
      return null;
    }
  }
}
