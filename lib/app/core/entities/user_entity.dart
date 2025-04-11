import 'package:teste_flutter_firebase/app/core/entities/company_entity.dart';

class UserEntity {
  final int id;

  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  final CompanyEntity company;

  UserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'],
      name: map['name'],
      username: map['username'],
      email: map['email'],
      phone: map['phone'],
      website: map['website'],
      company: CompanyEntity.fromMap(map['company']),
    );
  }
}
