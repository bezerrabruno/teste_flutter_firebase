import 'package:teste_flutter_firebase/app/domain/entities/profile_entity.dart';

abstract class ExternalProfileDatasource {
  Future<Map<String, dynamic>> getProfile(String uid);

  Future<Map<String, dynamic>> updateProfile(ProfileEntity pofile);
}
