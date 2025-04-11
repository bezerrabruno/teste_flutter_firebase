import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_flutter_firebase/app/core/entities/idea_entity.dart';

class IdeaCard extends StatelessWidget {
  final IdeaEntity ideaEntity;

  final Function() onTap;

  const IdeaCard({
    super.key,
    required this.ideaEntity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: 154,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  size: 32,
                  color: Colors.blueAccent,
                  CupertinoIcons.profile_circled,
                ),
                SizedBox(width: 6),
                Text(
                  ideaEntity.userId.toString().padLeft(6, '0'),
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              ideaEntity.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 12),
            Text(
              ideaEntity.body,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
