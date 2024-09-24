import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:kdigital_test/src/core/http/endpoints.dart';

@Singleton()
class DioClient {
  final options = BaseOptions(
    baseUrl: EndPoints.baseUrl,
  );
  final dio = Dio();

  DioClient() {
    dio.options = options;
  }
}
