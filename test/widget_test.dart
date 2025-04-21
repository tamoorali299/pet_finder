import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_finder/main.dart';
import 'package:pet_finder/presentation/screens/auth/login_screen.dart';
import 'package:pet_finder/presentation/screens/main/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:pet_finder/presentation/providers/auth_provider.dart';

void main() {
  testWidgets('Pet Finder login interaction test', (WidgetTester tester) async {
    // Build the PetFinderApp
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: const MyApp(),
      ),
    );

    // Wait for the splash screen to navigate
    await tester.pumpAndSettle();

    // Verify LoginScreen is displayed
    expect(find.byType(LoginScreen), findsOneWidget);

    // Enter credentials
    await tester.enterText(find.byType(TextField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextField).at(1), 'password');
    await tester.pump();

    // Tap the Login button
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Verify navigation to MainScreen after successful login
    expect(find.byType(LoginScreen), findsNothing);
    expect(find.byType(MainScreen), findsOneWidget);
  });
}