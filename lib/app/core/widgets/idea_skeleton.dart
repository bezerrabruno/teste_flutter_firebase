import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class IdeaSkeleton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 138,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer(
            child: Container(
              height: 24,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 8),
          Shimmer(
            child: Container(
              height: 16,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          SizedBox(height: 4),
          Shimmer(
            child: Container(
              height: 16,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          SizedBox(height: 12),
          Shimmer(
            child: Container(
              height: 16,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          SizedBox(height: 4),
          Shimmer(
            child: Container(
              height: 16,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
          SizedBox(height: 4),
          Shimmer(
            child: Container(
              height: 16,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
