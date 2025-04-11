class CompanyEntity {
  final String name;
  final String catchPhrase;
  final String bs;

  CompanyEntity({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory CompanyEntity.fromMap(Map<String, dynamic> map) {
    return CompanyEntity(
      name: map['name'],
      catchPhrase: map['catchPhrase'],
      bs: map['bs'],
    );
  }
}
