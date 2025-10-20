import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/widgets/animated_middle_button.dart';
import 'package:roqqu_mobile_t/main.dart';
import 'package:roqqu_mobile_t/common/widgets/risk_level_card.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/providers/main_screen_providers.dart';

void main() {
  // TEST GROUP 1: A simple, reliable smoke test for app startup.
  group('App Smoke Test', () {
    testWidgets('App launches and displays the Onboarding screen',
        (WidgetTester tester) async {
      // Arrange: Pump the root widget of the app.
      // ProviderScope is essential for any test involving Riverpod.
      await tester.pumpWidget(const ProviderScope(child: MyApp()));

      // Act: Wait for any initial animations (like the onboarding fade-in) to complete.
      await tester.pumpAndSettle();

      // Assert: Verify that a key piece of text from the initial route ('/onboarding') is visible.
      // This proves that the app starts, Riverpod is initialized, go_router is working,
      // and the initial screen is rendered.
      expect(find.text('Copy PRO traders'), findsOneWidget);
    });
  });

  // TEST GROUP 2: A focused test for a reusable UI component.
  group('Common Reusable Widgets', () {
    testWidgets('RiskLevelCard changes border color when selected',
        (WidgetTester tester) async {
      // Arrange: Build the widget in an unselected state. This test is isolated.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RiskLevelCard(
              title: 'Test Profile',
              description: 'This is a test description.',
              isSelected: false, // Start as unselected
              onTap: () {},
            ),
          ),
        ),
      );

      // Assert: Check that the initial border is transparent.
      var cardContainer =
          tester.widget<AnimatedContainer>(find.byType(AnimatedContainer));
      var decoration = cardContainer.decoration as BoxDecoration;
      expect((decoration.border as Border?)?.top.color, Colors.transparent);

      // Act: Rebuild the widget with isSelected = true to simulate a state change.
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: RiskLevelCard(
              title: 'Test Profile',
              description: 'This is a test description.',
              isSelected: true, // Now it is selected
              onTap: () {},
            ),
          ),
        ),
      );

      // We need one pump() to process the state change and start the animation.
      await tester.pump();

      // Assert: Check that the border color has changed to the selected color.
      cardContainer =
          tester.widget<AnimatedContainer>(find.byType(AnimatedContainer));
      decoration = cardContainer.decoration as BoxDecoration;
      expect((decoration.border as Border?)?.top.color, Colors.blueAccent);
    });
  });

  // TEST GROUP 3: A targeted test for Riverpod state management and UI reaction.
  group('Dashboard State Management', () {
    testWidgets(
        'AnimatedMiddleButton shows add icon on home screen and close icon on others',
        (WidgetTester tester) async {
      // Arrange: Create a ProviderContainer to manually control our providers.
      final container = ProviderContainer();

      // Act: Pump the widget we want to test.
      await tester.pumpWidget(
        UncontrolledProviderScope(
          container: container,
          child: const MaterialApp(
            home: Scaffold(
              body: AnimatedMiddleButton(),
            ),
          ),
        ),
      );

      // Assert: By default, the mainScreenIndexProvider is 0 (home).
      // We expect to find an 'add' icon.
      expect(find.byIcon(Icons.add), findsOneWidget);
      expect(find.byIcon(Icons.close), findsNothing);

      // Act: Manually change the state of the provider to simulate a tab switch.
      container
          .read(mainScreenIndexProvider.notifier)
          .setIndex(1); // Switch to "Wallet" tab

      // Act: Pump the widget tree to make it rebuild with the new state.
      await tester.pump();

      // Assert: The widget has rebuilt and should now show a 'close' icon.
      expect(find.byIcon(Icons.add), findsNothing);
      expect(find.byIcon(Icons.close), findsOneWidget);
    });
  });
}
