class CommentEntity {
  final int id;
  final String name;
  final String body;

  CommentEntity({
    required this.id,
    required this.name,
    required this.body,
  });

  static List<CommentEntity> fromList(List<dynamic> list) {
    final List<CommentEntity> comments = <CommentEntity>[];

    for (final map in list) {
      comments.add(
        CommentEntity(
          id: map['id'],
          name: map['name'],
          body: map['body'],
        ),
      );
    }

    return comments;
  }
}
