import 'package:flutter/material.dart';
import 'package:teste_flutter_firebase/app/core/entities/idea_entity.dart';
import 'package:teste_flutter_firebase/app/core/enum/page_state_enum.dart';
import 'package:teste_flutter_firebase/app/modules/idea_info/ui/controller/idea_info_controller.dart';

class IdeaInfoPage extends StatefulWidget {
  final IdeaEntity args;

  final IdeaInfoController controller;

  const IdeaInfoPage({
    super.key,
    required this.args,
    required this.controller,
  });

  @override
  IdeaInfoPageState createState() => IdeaInfoPageState();
}

class IdeaInfoPageState extends State<IdeaInfoPage> {
  @override
  void initState() {
    widget.controller.init(widget.args);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
          animation: widget.controller,
          builder: (context, _) {
            switch (widget.controller.pageState) {
              case PageStateEnum.initial:
              case PageStateEnum.loading:
                return Center(
                  child: CircularProgressIndicator(),
                );

              case PageStateEnum.error:
                return Center(
                  child: Text('Algo deu errado, tente novamente!'),
                );

              case PageStateEnum.empty:
                return Center(
                  child: Text('Nenhum post encontrado!'),
                );

              case PageStateEnum.success:
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.controller.userEntity?.username}',
                          ),
                          Text(
                            '${widget.args.title}',
                          ),
                          Text(
                            '${widget.args.body}',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListView.separated(
                        itemCount: widget.controller.comments.length,
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: Colors.blueAccent,
                          );
                        },
                        itemBuilder: (context, index) {
                          return Text(
                            widget.controller.comments.elementAt(index).body,
                          );
                        },
                      ),
                    ),
                  ],
                );
            }
          }),
    );
  }
}
