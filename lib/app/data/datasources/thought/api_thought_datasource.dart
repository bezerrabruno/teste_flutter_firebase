import 'package:teste_flutter_firebase/app/core/gateway/interfaces/api_request_adapter.dart';
import 'package:teste_flutter_firebase/app/core/gateway/rotas/api_rotas_util.dart';
import 'package:teste_flutter_firebase/app/infra/interfaces/thought/thought_repository.dart';

class ApiThoughtDatasource implements ExternalThoughtDatasource {
  final ApiRequestAdapter _apiRequestAdapter;

  ApiThoughtDatasource(this._apiRequestAdapter);

  @override
  Future<List<Map<String, dynamic>>> getAll() async {
    try {
      return await _apiRequestAdapter.get(ApiRotasUtil.thoughts);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getComments(int postId) async {
    try {
      return await _apiRequestAdapter.get('${ApiRotasUtil.comments}/$postId');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> getUser(int userId) async {
    try {
      return await _apiRequestAdapter.get('${ApiRotasUtil.users}/$userId');
    } catch (e) {
      rethrow;
    }
  }
}
