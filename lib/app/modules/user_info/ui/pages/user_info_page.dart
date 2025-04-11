import 'package:flutter/material.dart';
import 'package:teste_flutter_firebase/app/modules/idea_info/ui/controller/idea_info_controller.dart';

class UserInfoPage extends StatefulWidget {
  final IdeaInfoController controller;

  const UserInfoPage({
    super.key,
    required this.controller,
  });

  @override
  UserInfoPageState createState() => UserInfoPageState();
}

class UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(),
    );
  }
}
