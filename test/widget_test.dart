import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_mobile_t/core/router/app_router.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/widgets/animated_middle_button.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/widgets/custom_bottom_nav_bar.dart';

void main() {
  // TEST GROUP 1: A reliable test for the main application shell.
  group('MainScreen and Navigation Shell', () {
    testWidgets('MainScreen launches on the home tab without crashing',
        (WidgetTester tester) async {
      // Arrange: Create a special router instance for this test that starts
      // directly at the home screen, bypassing the onboarding flow.
      final testRouter = GoRouter(
        initialLocation: AppRoutes.home,
        routes: AppRouter.router.configuration.routes,
      );

      // Act: Pump a MaterialApp.router with our test-specific router.
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp.router(
            routerConfig: testRouter,
          ),
        ),
      );
      // Wait for any initial animations or frame settling.
      await tester.pumpAndSettle();

      // Assert: Verify that key components of the main UI are present.
      // This is a powerful "smoke test" for the main part of your app.
      expect(find.byType(CustomBottomNavBar), findsOneWidget);
      expect(find.text('Home'),
          findsOneWidget); // Checks for the "Home" nav bar item
      expect(find.text('Your GBP Balance'),
          findsOneWidget); // Checks for content from HomeScreen
    });
  });

  // TEST GROUP 2: A targeted test for the core modal overlay functionality.
  group('Dashboard Modal Overlay', () {
    testWidgets('Tapping the middle button shows and hides the modal overlay',
        (WidgetTester tester) async {
      // Arrange: Create a router that starts at the home screen.
      final testRouter = GoRouter(
        initialLocation: AppRoutes.home,
        routes: AppRouter.router.configuration.routes,
      );

      // Act: Pump the app.
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp.router(
            routerConfig: testRouter,
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Assert: We are on the Dashboard. Initially, the modal content is not visible,
      // and the button shows an 'add' icon.
      expect(find.text('Trade'),
          findsNothing); // 'Trade' is a title in MoreForYouSheet
      expect(find.byIcon(Icons.add), findsOneWidget);

      // Act: Find the middle button and tap it to show the modal.
      await tester.tap(find.byType(AnimatedMiddleButton));
      // pumpAndSettle waits for the slide-up/scale-up animation to complete.
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

  // TEST GROUP 3: A test for the tab navigation logic.
  group('Bottom Navigation Bar', () {
    testWidgets('Tapping a nav bar item switches the active tab',
        (WidgetTester tester) async {
      // Arrange: Create a router that starts at the home screen.
      final testRouter = GoRouter(
        initialLocation: AppRoutes.home,
        routes: AppRouter.router.configuration.routes,
      );
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp.router(
            routerConfig: testRouter,
          ),
        ),
      );
      await tester.pumpAndSettle();

      // Assert: We start on the HomeScreen.
      expect(find.text('Your GBP Balance'), findsOneWidget);
      expect(find.text('Wallet Page'), findsNothing);

      // Act: Find the "Wallet" text in the nav bar and tap it.
      final walletButton = find.ancestor(
          of: find.text('Wallet'), matching: find.byType(GestureDetector));

      await tester.tap(walletButton);
      await tester.pumpAndSettle();

      // Assert: The UI has now switched to the Wallet tab's placeholder page.
      expect(find.text('Your GBP Balance'), findsNothing);
      expect(find.text('Wallet Page'), findsOneWidget);

      final homeButton = find.ancestor(
          of: find.text('Home'), matching: find.byType(GestureDetector));
      await tester.tap(homeButton);
      await tester.pumpAndSettle();

      // Assert: We are back on the HomeScreen
      expect(find.text('Your GBP Balance'), findsOneWidget);
      expect(find.text('Wallet Page'), findsNothing);
    });
  });
}
