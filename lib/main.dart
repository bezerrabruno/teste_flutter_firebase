import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_flutter_firebase/app/core/app_module.dart';
import 'package:teste_flutter_firebase/app/core/app_widget.dart';
import 'package:teste_flutter_firebase/app/core/firebase/analytics.dart';
import 'package:teste_flutter_firebase/app/core/firebase/crashlytics.dart';
import 'package:teste_flutter_firebase/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await fireConfig();

  runApp(
    ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ),
  );
}

/// Funçao para inicializaçao do firebase.
Future<void> fireConfig() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Analytics.init();
  await Crashlytics.init();
}
