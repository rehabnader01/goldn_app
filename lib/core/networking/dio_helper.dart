import 'package:dio/dio.dart';
import 'package:goldn/core/networking/api_constants.dart';

class DioHelper {
  static late Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );
  }

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final res = await dio.get(endPoint, queryParameters: queryParameters);
      return res;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Error ${e.response!.statusCode}: ${e.response!.data}');
      } else {
        throw Exception('Connection failed: ${e.message}');
      }
    }
  }
}
