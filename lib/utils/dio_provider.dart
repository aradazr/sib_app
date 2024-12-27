import 'package:dio/dio.dart';
import 'package:sib_app/utils/5auth_manager.dart';

class DioProvider {
  static Dio createDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${AuthManager.readAuth()}'
        },
      ),
    );

    return dio;
  }

  static Dio createDioWithoutHeader() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https',
      ),
    );

    return dio;
  }
}
