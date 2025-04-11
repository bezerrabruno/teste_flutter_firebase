class IdeaEntity {
  final int id;
  final int userId;

  final String title;
  final String body;

  IdeaEntity({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  static List<IdeaEntity> fromList(List<dynamic> list) {
    final List<IdeaEntity> ideas = <IdeaEntity>[];

    for (final map in list) {
      ideas.add(
        IdeaEntity(
          id: map['id'],
          userId: map['userId'],
          title: map['title'],
          body: map['body'],
        ),
      );
    }

    return ideas;
  }

  static List<IdeaEntity> fromListWithFilter(String title, List<dynamic> list) {
    final List<IdeaEntity> ideas = <IdeaEntity>[];

    for (final map in list) {
      if (map['title'].toString().contains(title)) {
        ideas.add(
          IdeaEntity(
            id: map['id'],
            userId: map['userId'],
            title: map['title'],
            body: map['body'],
          ),
        );
      }
    }

    return ideas;
  }
}
