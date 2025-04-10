import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  static CollectionReference<Map<String, dynamic>> users() {
    return FirebaseFirestore.instance.collection('users');
  }
}
