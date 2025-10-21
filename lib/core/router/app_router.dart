import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_mobile_t/features/copytrading/presentation/screens/copy_trading_screen.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/home_screen.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/main_screen.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/widgets/page_place_holder.dart';
import 'package:roqqu_mobile_t/features/pro_traders/presentation/screens/pro_trader_details.dart';
import 'package:roqqu_mobile_t/features/pro_traders/presentation/screens/pro_traders_dashboard.dart';
import 'package:roqqu_mobile_t/features/risk_assessment/presentation/screens/risk_level_screen.dart';

class AppRoutes {
  // Initial Setup Flow
  static const copyTrading = '/'; // App entry point
  static const riskAssessment = '/risk-assessment';

  // Main App Tabs
  static const home = '/home'; // Home tab entry point
  static const wallet = '/wallet';
  static const history = '/history';
  static const profile = '/profile';

  // Sub-routes under Home
  static const proTraders = 'pro-traders'; // Relative path: /home/pro-traders
  static const traderDetails =
      'details'; // Relative path: /home/pro-traders/details/:traderId

  // Other Top-Level Routes
  static const confirmTransaction = '/confirm-transaction';
}

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,

    // Redirect logic for onboarding (uncomment when ready)
    // redirect: (BuildContext context, GoRouterState state) {
    //   const bool hasCompletedOnboarding = false; // Replace with actual logic
    //   final bool isGoingToOnboarding = state.matchedLocation == AppRoutes.copyTrading ||
    //       state.matchedLocation == AppRoutes.riskAssessment;
    //   if (!hasCompletedOnboarding && !isGoingToOnboarding) {
    //     return AppRoutes.copyTrading;
    //   }
    //   if (hasCompletedOnboarding && isGoingToOnboarding) {
    //     return AppRoutes.home;
    //   }
    //   return null;
    // },

    routes: [
      // Onboarding Flow
      GoRoute(
        path: AppRoutes.copyTrading,
        builder: (context, state) => const CopyTradingScreen(),
      ),
      GoRoute(
        path: AppRoutes.riskAssessment,
        builder: (context, state) => const RiskLevelScreen(),
      ),

      // Main App with Tabs
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainScreen(navigationShell: navigationShell);
        },
        branches: [
          // Home Tab
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'shellHome'),
            routes: [
              GoRoute(
                path: AppRoutes.home,
                pageBuilder: (c, s) => NoTransitionPage(
                  key: s.pageKey,
                  child: const HomeScreen(),
                ),
                routes: [
                  // Pro Traders (sub-route of Home)
                  GoRoute(
                    path: AppRoutes.proTraders, // /home/pro-traders
                    builder: (c, s) => ProTradersDashboard(),
                    routes: [
                      // Trader Details (sub-route of Pro Traders)
                      GoRoute(
                        path:
                            '${AppRoutes.traderDetails}/:traderId', // /home/pro-traders/details/:traderId
                        builder: (c, s) => ProTraderDetailsScreen(
                          traderId: s.pathParameters['traderId']!,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          // Wallet Tab
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'shellWallet'),
            routes: [
              GoRoute(
                path: AppRoutes.wallet,
                builder: (c, s) => const PagePlaceholder(title: 'Wallet'),
              ),
            ],
          ),

          // History Tab
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'shellHistory'),
            routes: [
              GoRoute(
                path: AppRoutes.history,
                builder: (c, s) => const PagePlaceholder(title: 'History'),
              ),
            ],
          ),

          // Profile Tab
          StatefulShellBranch(
            navigatorKey: GlobalKey<NavigatorState>(debugLabel: 'shellProfile'),
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                builder: (c, s) => const PagePlaceholder(title: 'Profile'),
              ),
            ],
          ),
        ],
      ),

      // Other Top-Level Routes
      GoRoute(
        path: AppRoutes.confirmTransaction,
        builder: (context, state) =>
            const PagePlaceholder(title: 'Confirm Transaction'),
      ),
    ],
  );
}
