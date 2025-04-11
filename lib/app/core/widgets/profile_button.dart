import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final Function() onTap;

  const ProfileButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(36),
        child: Icon(
          size: 54,
          color: Colors.blueAccent,
          CupertinoIcons.profile_circled,
        ),
      ),
    );
  }
}
