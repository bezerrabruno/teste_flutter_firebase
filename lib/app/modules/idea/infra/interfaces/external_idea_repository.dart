abstract class ExternalIdeaDatasource {
  Future<List<dynamic>> getAll();

  Future<List<dynamic>> getComments(int ideaId);

  Future<Map<String, dynamic>> getUser(int userId);
}
