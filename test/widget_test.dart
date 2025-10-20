import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:roqqu_mobile_t/common/widgets/risk_level_card.dart';
import 'package:roqqu_mobile_t/main.dart';

void main() {
  // A test group for all application-level or "smoke" tests
  group('App Integration and Smoke Tests', () {
    testWidgets('App launches without crashing and shows OnboardingScreen',
        (WidgetTester tester) async {
      // Arrange: Pump the main app widget.
      // CRITICAL: We wrap MyApp in a ProviderScope to initialize Riverpod for all tests.
      await tester.pumpWidget(
        const ProviderScope(
          child: MyApp(),
        ),
      );

      // Assert: Verify that the first screen's content is visible.
      // This is a great "smoke test" - it proves the app starts, routing works,
      // and the initial screen renders.
      expect(find.text('Copy PRO traders'), findsOneWidget);
      expect(find.text('Get started'), findsOneWidget);
    });
  });

  // A test group specifically for the Onboarding feature
  group('Onboarding Feature', () {
    testWidgets('Swiping on OnboardingScreen navigates between pages',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const ProviderScope(
          child: MyApp(),
        ),
      );

      // Assert: Initial state is correct
      expect(find.text('Copy PRO traders'), findsOneWidget);
      expect(find.text('Do less, Win more'), findsNothing);

      // Act: Simulate a horizontal swipe gesture from left to right.
      await tester.drag(find.byType(PageView), const Offset(-400.0, 0.0));
      // pumpAndSettle waits for the swipe animation to complete.
      await tester.pumpAndSettle();

      // Assert: The UI has updated to show the second page.
      expect(find.text('Copy PRO traders'), findsNothing);
      expect(find.text('Do less, Win more'), findsOneWidget);
    });
  });

  // A test group for common reusable widgets
  group('Common Reusable Widgets', () {
    testWidgets('RiskLevelCard changes appearance when selected',
        (WidgetTester tester) async {
      // Arrange: A variable to track taps
      int tapCount = 0;

      // Act: Pump the widget in an unselected state.
      // We test this widget in isolation, not the whole app.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RiskLevelCard(
              title: 'Test Profile',
              description: 'This is a test description.',
              isSelected: false,
              onTap: () => tapCount++,
            ),
          ),
        ),
      );

      // Assert: Check the initial state
      expect(find.text('Test Profile'), findsOneWidget);

      // Find the container and check its initial border color (should be transparent)
      var cardContainer =
          tester.widget<AnimatedContainer>(find.byType(AnimatedContainer));
      var decoration = cardContainer.decoration as BoxDecoration;
      expect((decoration.border as Border?)?.top.color, Colors.transparent);

      // Act: Simulate a tap
      await tester.tap(find.byType(RiskLevelCard));
      await tester.pumpAndSettle();

      // Assert: The onTap callback was called
      expect(tapCount, 1);

      // Act: Re-pump the widget in a 'selected' state to test the visual change
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RiskLevelCard(
              title: 'Test Profile',
              description: 'This is a test description.',
              isSelected: true, // Now it's selected
              onTap: () {},
            ),
          ),
        ),
      );

      // Assert: Check the selected state visuals
      cardContainer =
          tester.widget<AnimatedContainer>(find.byType(AnimatedContainer));
      decoration = cardContainer.decoration as BoxDecoration;
      // Check that the border color is now the selected color
      expect((decoration.border as Border?)?.top.color, Colors.blueAccent);
    });
  });
}
