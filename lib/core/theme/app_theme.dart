import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryDark = Color(0xFF1C2127);
  static const Color cardDark = Color(0xFF20252B);
  static const Color textLight = Color(0xFFA7B1BC);
  static const Color accentGreen = Color(0xFF25D366);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF8A2BE2), Color(0xFFD434C6)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  // Gradient for the "My dashboard" card
  static const LinearGradient dashboardCardGradient = LinearGradient(
    colors: [
      Color(0xFFABE2F3), // #ABE2F3
      Color(0xFFBDE4E5), // #BDE4E5
      Color(0xFFEBE9D0), // #EBE9D0
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Gradient for the "Become a PRO trader" card
  static const LinearGradient proTraderCardGradient = LinearGradient(
    colors: [
      Color(0xFFC0CFFE), // #C0CFFE
      Color(0xFFF3DFF4), // #F3DFF4
      Color(0xFFF9D8E5), // #F9D8E5
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'Encode Sans',
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Inter',
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Inter',
      color: textLight,
      fontSize: 14,
      height: 1.5,
    ),
  );
}
