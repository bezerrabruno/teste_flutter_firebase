class ProfileEntity {
  final String uid;

  final String name;
  final String username;
  final String age;
  final int qtd_posts;

  final List<String> likes;

  ProfileEntity({
    required this.uid,
    required this.name,
    required this.username,
    required this.age,
    required this.qtd_posts,
    required this.likes,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'username': username,
      'age': age,
      'qtd_posts': qtd_posts,
      'likes': likes,
    };
  }

  factory ProfileEntity.fromMap(String uid, Map<String, dynamic> map) {
    return ProfileEntity(
      uid: uid,
      name: map['name'],
      username: map['username'],
      age: map['age'],
      qtd_posts: map['qtd_posts'],
      likes: map['likes'],
    );
  }
}
