import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_flutter_firebase/app/core/enum/page_state_enum.dart';
import 'package:teste_flutter_firebase/app/core/widgets/app_button.dart';
import 'package:teste_flutter_firebase/app/modules/profile/ui/controller/profile_controller.dart';

class ProfilePage extends StatefulWidget {
  final ProfileController controller;

  const ProfilePage({
    super.key,
    required this.controller,
  });

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    widget.controller.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: AnimatedBuilder(
            animation: widget.controller,
            builder: (context, _) {
              switch (widget.controller.pageState) {
                case PageStateEnum.initial:
                case PageStateEnum.loading:
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                  );

                case PageStateEnum.error:
                case PageStateEnum.empty:
                  return Center(
                    child: Text('Algo deu errado, tente novamente!'),
                  );

                case PageStateEnum.success:
                  return Column(
                    children: [
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Icon(
                              size: 200,
                              color: Colors.white,
                              CupertinoIcons.profile_circled,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Nome: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.controller.profileEntity!.name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Apelido: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.controller.profileEntity!.username,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Quantidade de posts: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.controller.profileEntity!.qtd_posts
                                  .toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Likes: ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.controller.profileEntity!.likes
                                  .join(', ')
                                  .toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Salvar Biometria',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Switch(
                              value: widget.controller.biometria,
                              onChanged: widget.controller.changeBiometria,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 32),
                        child: AppButton(
                          textButton: 'Sair',
                          onTap: widget.controller.popAll,
                        ),
                      ),
                    ],
                  );
              }
            }),
      ),
    );
  }
}
