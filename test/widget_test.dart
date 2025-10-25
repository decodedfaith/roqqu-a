import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_mobile_t/core/router/app_router.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/providers/coin_providers.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/widgets/animated_middle_button.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/widgets/custom_bottom_nav_bar.dart';

void main() {
  // TEST GROUP 1: A reliable test for the main application shell.
  group('MainScreen and Navigation Shell', () {
    testWidgets('MainScreen launches on the home tab without crashing',
        (WidgetTester tester) async {
      // Arrange: Create a test router starting at the home screen
      final testRouter = GoRouter(
        navigatorKey: AppRouter.rootNavigatorKey,
        initialLocation: AppRoutes.home,
        routes: AppRouter.router.configuration.routes,
      );

      // Mock the coinList provider with a completed stream
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            coinListProvider.overrideWith((ref) {
              return Stream.value([]); // Simulate an empty but loaded stream
            }),
          ],
          child: MaterialApp.router(
            routerConfig: testRouter,
          ),
        ),
      );

      // Act: Pump the widget tree and wait for stability
      await tester.pump();
      await tester.pumpAndSettle();

      // Assert: Verify key UI components
      expect(find.byType(CustomBottomNavBar), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Your GBP Balance'), findsOneWidget);
    });
  });

  // TEST GROUP 2: A targeted test for the core modal overlay functionality.
  group('Dashboard Modal Overlay', () {
    testWidgets('Tapping the middle button shows and hides the modal overlay',
        (WidgetTester tester) async {
      // Arrange: Create a router starting at the home screen
      final testRouter = GoRouter(
        navigatorKey: AppRouter.rootNavigatorKey,
        initialLocation: AppRoutes.home,
        routes: AppRouter.router.configuration.routes,
      );

      // Mock the coinList provider
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            coinListProvider.overrideWith((ref) {
              return Stream.value([]);
            }),
          ],
          child: MaterialApp.router(
            routerConfig: testRouter,
          ),
        ),
      );
      await tester.pump();
      await tester.pumpAndSettle();

      // Assert: Initially, modal content is not visible, and button shows 'add'
      expect(find.text('Trade'), findsNothing);
      expect(find.byIcon(Icons.add), findsOneWidget);

      // Act: Tap the middle button to show the modal
      await tester.tap(find.byType(AnimatedMiddleButton));
      await tester.pumpAndSettle();

      // Assert: Modal content is visible, and button shows 'close'
      expect(find.text('Trade'), findsOneWidget);
      expect(find.byIcon(Icons.close), findsOneWidget);

      // Act: Tap the middle button again to hide the modal
      await tester.tap(find.byType(AnimatedMiddleButton));
      await tester.pumpAndSettle();

      // Assert: Modal content is hidden, and icon reverts to 'add'
      expect(find.text('Trade'), findsNothing);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });
  });
}
