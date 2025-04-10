abstract class ExternalThoughtDatasource {
  Future<List<Map<String, dynamic>>> getAll();

  Future<List<Map<String, dynamic>>> getComments(int postId);

  Future<Map<String, dynamic>> getUser(int userId);
}
