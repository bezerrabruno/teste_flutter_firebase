import 'package:teste_flutter_firebase/app/core/gateway/interfaces/api_request_adapter.dart';
import 'package:teste_flutter_firebase/app/core/gateway/rotas/api_rotas_util.dart';
import 'package:teste_flutter_firebase/app/modules/idea/infra/interfaces/external_idea_repository.dart';

class ApiIdeaDatasource implements ExternalIdeaDatasource {
  final ApiRequestAdapter _apiRequestAdapter;

  ApiIdeaDatasource(this._apiRequestAdapter);

  @override
  Future<List<dynamic>> getAll() async {
    try {
      final result = await _apiRequestAdapter.get(ApiRotasUtil.ideas);

      return result.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<dynamic>> getComments(int postId) async {
    try {
      final result = await _apiRequestAdapter.get(
        '${ApiRotasUtil.comments}',
        queryParameters: {'postId': postId},
      );

      return result.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getUser(int userId) async {
    try {
      final result =
          await _apiRequestAdapter.get('${ApiRotasUtil.users}/$userId');

      return result.data;
    } catch (e) {
      rethrow;
    }
  }
}
