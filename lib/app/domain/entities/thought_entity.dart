class ThoughtEntity {
  final int id;
  final int userId;

  final String title;
  final String body;

  ThoughtEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  static List<ThoughtEntity> fromList(List<Map<String, dynamic>> list) {
    final List<ThoughtEntity> thoughts = <ThoughtEntity>[];

    for (final map in list) {
      thoughts.add(
        ThoughtEntity(
          id: map['id'],
          userId: map['userId'],
          title: map['title'],
          body: map['body'],
        ),
      );
    }

    return thoughts;
  }

  static List<ThoughtEntity> fromListWithFilter(
      String title, List<Map<String, dynamic>> list) {
    final List<ThoughtEntity> thoughts = <ThoughtEntity>[];

    for (final map in list) {
      if (map['title'].toString().contains(title)) {
        thoughts.add(
          ThoughtEntity(
            id: map['id'],
            userId: map['userId'],
            title: map['title'],
            body: map['body'],
          ),
        );
      }
    }

    return thoughts;
  }
}
