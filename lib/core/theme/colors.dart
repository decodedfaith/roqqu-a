import 'package:flutter/material.dart';

class AppColors {
  // Backgrounds
  static const Color background = Color(0xFF1C2127);
  static const Color cardBackground = Color(0xFF262932);
  static const Color cardDark = Color(0xFF20252B);

  // Text
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFA7B1BC);
  static const Color textAccent = Color(0xFF85D1F0);
  static const Color textBlack = Colors.black87;
  static const Color textBlack54 = Colors.black54;

  // Accents
  static const Color accentGreen = Color(0xFF25D366);
  static const Color accentRed = Colors.redAccent;
  static const Color primaryPurple = Color(0xFF8A2BE2);

  // Gradients
  static const List<Color> primaryGradient = [
    Color(0xFF8A2BE2),
    Color(0xFFD434C6)
  ];
  static const List<Color> dashboardGradient = [
    Color(0xFFABE2F3),
    Color(0xFFBDE4E5),
    Color(0xFFEBE9D0)
  ];
  static const List<Color> proTraderGradient = [
    Color(0xFFC0CFFE),
    Color(0xFFF3DFF4),
    Color(0xFFF9D8E5)
  ];
  static const List<Color> copyTradingGradient1 = [
    Color(0xFFFEC536),
    Color(0xFF98AAFE),
    Color(0xFF6179FA)
  ];
  static const List<Color> copyTradingGradient2 = [
    Color(0xFFABE2F3),
    Color(0xFFBDE4E5),
    Color(0xFFEBE9D0)
  ];

  // Misc
  static const Color divider =
      Color(0xFF262932); // Using card background as divider/border often
  static const Color white70 = Colors.white70;
}
