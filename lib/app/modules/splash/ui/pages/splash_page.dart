import 'package:flutter/material.dart';
import 'package:teste_flutter_firebase/app/modules/splash/ui/controller/splash_controller.dart';

class SplashPage extends StatefulWidget {
  final SplashController controller;

  const SplashPage({
    super.key,
    required this.controller,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    widget.controller.init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: AnimatedBuilder(
          animation: widget.controller,
          builder: (context, _) {
            return Hero(
              tag: 'FlutterLogo',
              child: FlutterLogo(
                key: Key('logo'),
                duration: Duration(seconds: 1),
                size: widget.controller.animation ? 140 : 200,
                style: widget.controller.animation
                    ? FlutterLogoStyle.stacked
                    : FlutterLogoStyle.markOnly,
                textColor: Colors.lightBlueAccent,
              ),
            );
          },
        ),
      ),
    );
  }
}
