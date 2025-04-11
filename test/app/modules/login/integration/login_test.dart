import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_flutter_firebase/app/core/widgets/fingerprint_button.dart';
import 'package:teste_flutter_firebase/app/modules/login/domain/login_with_email_usecase.dart';
import 'package:teste_flutter_firebase/app/modules/login/ui/controller/login_controller.dart';
import 'package:teste_flutter_firebase/app/modules/login/ui/pages/login_page.dart';

class MockModularNavigate extends Mock implements IModularNavigator {}

class MockUser extends Mock implements User {}

class MockLoginWithEmailUsecase extends Mock implements LoginWithEmailUsecase {}

void main() {
  final navigator = MockModularNavigate();
  final loginUsecase = MockLoginWithEmailUsecase();
  Modular.navigatorDelegate = navigator;

  setUp(() {
    when(() => navigator.navigate(any())).thenAnswer((_) => Future.value());
  });

  testWidgets('Deve ser capaz de clicar em cadastrar e entrar com biometria',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: LoginPage(
          controller: LoginController(loginUsecase),
        ),
      ),
    );

    /// Valida se nada ocorreu de errado.
    await tester.tap(find.text('Cadastrar'));
    await tester.pump(Duration(seconds: 1));
  });
}
