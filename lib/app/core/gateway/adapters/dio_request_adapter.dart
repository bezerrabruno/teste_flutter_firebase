import 'package:dio/dio.dart';
import 'package:teste_flutter_firebase/app/core/gateway/interfaces/api_request_adapter.dart';

/// Implementação do [ApiRequestAdapter] utilizando biblioteca [Dio]
/// para requests externas a URL's
class DioApiRequestAdapter implements ApiRequestAdapter {
  final Dio _dio;

  DioApiRequestAdapter(this._dio);

  @override
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result = await _dio.get(
        path,
        queryParameters: queryParameters,
      );

      if (result.statusCode == 200) {
        return result;
      }

      throw Exception('StatusCode: ${result.statusCode}');
    } catch (e) {
      rethrow;
    }
  }
}
