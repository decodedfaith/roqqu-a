import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/main_screen.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/widgets/animated_middle_button.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/widgets/custom_bottom_nav_bar.dart';

// A mock version of MyApp for testing purposes
class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    // We start the app directly at the MainScreen for these tests
    return const MaterialApp(
      home: MainScreen(),
    );
  }
}

void main() {
  // TEST GROUP 1: A reliable smoke test for your main application screen.
  group('MainScreen Smoke Test', () {
    testWidgets('MainScreen launches with NavBar and HomeScreen visible',
        (WidgetTester tester) async {
      // Arrange: Pump the TestApp, which starts at MainScreen.
      // ProviderScope is essential for Riverpod.
      await tester.pumpWidget(
        const ProviderScope(
          child: TestApp(),
        ),
      );
      // Wait for any initial animations to settle.
      await tester.pumpAndSettle();

      // Assert: Verify that key components of the main UI are present.
      expect(find.byType(CustomBottomNavBar), findsOneWidget);
      expect(find.text('Home'),
          findsOneWidget); // Checks for the "Home" nav bar item label
      expect(find.text('Your GBP Balance'),
          findsOneWidget); // Checks for content from HomeScreen
    });
  });

  // TEST GROUP 2: A targeted test for the core modal overlay functionality.
  group('Dashboard Modal Overlay', () {
    testWidgets('Tapping the middle button shows and hides the modal overlay',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const ProviderScope(
          child: TestApp(),
        ),
      );
      await tester.pumpAndSettle();

      // Assert: Initially, the modal content is not visible, and the button shows an 'add' icon.
      expect(find.text('Trade'),
          findsNothing); // 'Trade' is a title in MoreForYouSheet
      expect(find.byIcon(Icons.add), findsOneWidget);

      // Act: Find the middle button and tap it to show the modal.
      await tester.tap(find.byType(AnimatedMiddleButton));
      // pumpAndSettle waits for the slide-up animation to complete.
      await tester.pumpAndSettle();

      // Assert: The modal content is now visible, and the button shows a 'close' icon.
      expect(find.text('Trade'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);

      // Act: Tap the middle button again to hide the modal.
      await tester.tap(find.byType(AnimatedMiddleButton));
      await tester.pumpAndSettle();

      // Assert: The modal content is hidden again, and the icon has reverted to 'add'.
      expect(find.text('Trade'), findsNothing);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });
  });
}
