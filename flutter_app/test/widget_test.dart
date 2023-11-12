import 'package:flutter/material.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('Login screen test', (WidgetTester tester) async {
    // Crie um MockNavigatorObserver para observar navegações
    final mockObserver = MockNavigatorObserver();

    // Construa nossa tela e acione todos os micromodos
    await tester.pumpWidget(
      MaterialApp(
        home: const LogInScreen(),
        navigatorObservers: [mockObserver],
      ),
    );

    // Verifique se a AppBar foi renderizada corretamente
    expect(find.text('Login'), findsWidgets);
    expect(find.byType(AppBar), findsOneWidget);

    // Verifique se o botão "Sou aluno" foi renderizado corretamente
    expect(find.text('Sou aluno'), findsOneWidget);
    expect(find.text('Sou professor'), findsOneWidget);
  });
}
