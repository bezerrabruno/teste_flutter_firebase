import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teste_flutter_firebase/app/modules/splash/ui/controller/splash_controller.dart';
import 'package:teste_flutter_firebase/app/modules/splash/ui/pages/splash_page.dart';

class MockModularNavigate extends Mock implements IModularNavigator {}

void main() {
  final navigator = MockModularNavigate();
  Modular.navigatorDelegate = navigator;

  setUp(() {
    when(() => navigator.navigate(any())).thenAnswer((_) => Future.value());
  });

  testWidgets('Deve iniciar page, passar animação e navegar para Login',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: SplashPage(
          controller: SplashController(),
        ),
      ),
    );

    expect(find.byKey(Key('logo')), findsOneWidget);

    await tester.pump(Duration(seconds: 5));

    verify(() => navigator.navigate(any())).called(1);
  });
}
