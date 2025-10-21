import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_mobile_t/core/router/app_router.dart';
import 'package:roqqu_mobile_t/core/theme/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Set the system UI overlay style to make the status bar transparent.
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: ThemeData(
        brightness: Brightness.dark,

        scaffoldBackgroundColor: AppColors.background,

        primaryColor: AppColors.primaryText,

        fontFamily: 'Inter',
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          onSurface: AppColors.primaryText,
          surface: AppColors.surface,
        ),

        // Define global text styles to ensure consistency.
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
          bodyLarge: TextStyle(fontWeight: FontWeight.normal, fontSize: 16.0),
          labelLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
        ),
      ),
    );
  }
}
