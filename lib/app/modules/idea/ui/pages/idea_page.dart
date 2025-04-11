import 'package:flutter/material.dart';
import 'package:teste_flutter_firebase/app/core/enum/page_state_enum.dart';
import 'package:teste_flutter_firebase/app/core/widgets/app_button.dart';
import 'package:teste_flutter_firebase/app/core/widgets/idea_card.dart';
import 'package:teste_flutter_firebase/app/core/widgets/idea_skeleton.dart';
import 'package:teste_flutter_firebase/app/core/widgets/profile_button.dart';
import 'package:teste_flutter_firebase/app/modules/idea/ui/controller/idea_controller.dart';

class IdeaPage extends StatefulWidget {
  final IdeaController controller;

  const IdeaPage({
    super.key,
    required this.controller,
  });

  @override
  IdeaPageState createState() => IdeaPageState();
}

class IdeaPageState extends State<IdeaPage> {
  @override
  void initState() {
    widget.controller.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        showDialog(
          context: context,
          builder: (_) => Dialog(
            child: SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Deseja realmente sair?',
                      style: TextStyle(fontSize: 28),
                    ),
                    Divider(),
                    AppButton(
                      textButton: 'sair',
                      onTap: widget.controller.popAll,
                    ),
                    SizedBox(height: 8),
                    AppButton(
                      textButton: 'cancelar',
                      onTap: widget.controller.pop,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
          actions: [ProfileButton(onTap: widget.controller.navigateProfile)],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: AnimatedBuilder(
              animation: widget.controller,
              builder: (context, _) {
                switch (widget.controller.pageState) {
                  case PageStateEnum.initial:
                  case PageStateEnum.loading:
                    return ListView.separated(
                        itemCount: 10,
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: Colors.blueAccent,
                            thickness: 2,
                          );
                        },
                        itemBuilder: (context, index) {
                          return IdeaSkeleton();
                        });

                  case PageStateEnum.error:
                    return Center(
                      child: Text('Algo deu errado, tente novamente!'),
                    );

                  case PageStateEnum.empty:
                    return Center(
                      child: Text('Nenhum post encontrado!'),
                    );

                  case PageStateEnum.success:
                    return ListView.separated(
                      itemCount: widget.controller.ideas.length,
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Colors.blueAccent,
                          thickness: 2,
                        );
                      },
                      itemBuilder: (context, index) {
                        return IdeaCard(
                          ideaEntity: widget.controller.ideas.elementAt(index),
                          onTap: () => widget.controller.navigateInfo(
                            widget.controller.ideas.elementAt(index),
                          ),
                        );
                      },
                    );
                }
              }),
        ),
      ),
    );
  }
}
