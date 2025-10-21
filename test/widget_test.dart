import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/widgets/animated_middle_button.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/widgets/custom_bottom_nav_bar.dart';
import 'package:roqqu_mobile_t/main.dart';

void main() {
  // TEST GROUP 1: A reliable smoke test for your main application screen.
  group('App Smoke and Navigation Test', () {
    testWidgets('App launches on Onboarding, and can navigate to Dashboard',
        (WidgetTester tester) async {
      // Arrange: Pump the REAL app. ProviderScope is inside MyApp's main() so we don't need it here.
      await tester.pumpWidget(const ProviderScope(child: MyApp()));

      // Act: Wait for any initial animations on the onboarding screen.
      await tester.pumpAndSettle();

      // Assert: Verify that we are on the Onboarding screen as defined by go_router's initialLocation.
      expect(find.text('Copy PRO traders'), findsOneWidget);

      // Act: Find the "Get started" button and tap it to navigate.
      await tester.tap(find.text('Get started'));
      // Wait for navigation and any new screen animations to complete.
      await tester.pumpAndSettle();

      // Assert: Verify that we have successfully navigated to the Dashboard.
      // We check for elements from both the CustomBottomNavBar and the HomeScreen.
      expect(find.byType(CustomBottomNavBar), findsOneWidget);
      expect(find.text('Your GBP Balance'), findsOneWidget);
    });
  });

  // TEST GROUP 2: A targeted test for the core modal overlay functionality.
  group('Dashboard Modal Overlay', () {
    testWidgets(
        'Tapping the middle button on Dashboard shows and hides the modal overlay',
        (WidgetTester tester) async {
      // Arrange: Pump the app.
      await tester.pumpWidget(const ProviderScope(child: MyApp()));
      await tester.pumpAndSettle();

      // Act: Navigate from Onboarding to the Dashboard to set up the test state.
      await tester.tap(find.text('Get started'));
      await tester.pumpAndSettle();
      // Optional: a second navigation step if you have a risk screen
      // await tester.tap(find.text('Proceed'));
      // await tester.pumpAndSettle();

      // Assert: We are on the Dashboard. Initially, the modal is hidden and the icon is 'add'.
      expect(find.text('Trade'), findsNothing);
      expect(find.byIcon(Icons.add), findsOneWidget);

      // Act: Tap the middle button to show the modal.
      await tester.tap(find.byType(AnimatedMiddleButton));
      await tester.pumpAndSettle();

      // Assert: The modal is now visible, and the icon is 'close'.
      expect(find.text('Trade'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);

      // Act: Tap it again to hide it.
      await tester.tap(find.byType(AnimatedMiddleButton));
      await tester.pumpAndSettle();

      // Assert: The modal is hidden again.
      expect(find.text('Trade'), findsNothing);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });
  });
}
