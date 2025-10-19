import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_mobile_t/core/theme/colors.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/main_screen.dart';

void main() {
  runApp(
    // All of your app's code must be a descendant of ProviderScope.
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

      home: const MainScreen(),
    );
  }
}
