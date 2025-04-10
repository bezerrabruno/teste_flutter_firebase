abstract class ApiRequestAdapter {
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  });
}
