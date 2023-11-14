import 'package:flutter/material.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  testWidgets('Login screen test', (WidgetTester tester) async {
    // Create a MockNavigatorObserver to observe navigations
    final mockObserver = MockNavigatorObserver();

    // Build screen and activete micro modules
    await tester.pumpWidget(
      MaterialApp(
        home: const LogInScreen(),
        navigatorObservers: [mockObserver],
      ),
    );

    // Verify iff AppBar war rendered correctly
    expect(find.text('Login'), findsWidgets);
    expect(find.byType(AppBar), findsOneWidget);

    // Verify if Student and Teacher Buttons were rendered correctly
    expect(find.text('Sou aluno'), findsOneWidget);
    expect(find.text('Sou professor'), findsOneWidget);
  });
}
