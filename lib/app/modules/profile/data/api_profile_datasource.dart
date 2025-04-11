import 'package:teste_flutter_firebase/app/core/entities/profile_entity.dart';
import 'package:teste_flutter_firebase/app/core/firebase/firestore.dart';
import 'package:teste_flutter_firebase/app/modules/profile/infra/interfaces/external_profile_datasource.dart';

class ApiProfileDatasource implements ExternalProfileDatasource {
  @override
  Future<Map<String, dynamic>> getProfile(String uid) async {
    try {
      final result = await Firestore.users().doc(uid).get();

      if (result.exists) {
        return result.data()!;
      } else {
        throw Exception('result empty');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> updateProfile(ProfileEntity profile) async {
    try {
      await Firestore.users().doc(profile.uid).update(profile.toMap());

      return profile.toMap();
    } catch (e) {
      rethrow;
    }
  }
}
