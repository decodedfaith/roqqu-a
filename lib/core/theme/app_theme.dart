import 'package:flutter/material.dart';
import 'package:roqqu_mobile_t/core/theme/colors.dart';

class AppTheme {
  static const Color primaryDark = AppColors.background;
  static const Color cardDark = AppColors.cardDark;
  static const Color textLight = AppColors.textSecondary;
  static const Color accentGreen = AppColors.accentGreen;

  static const LinearGradient primaryGradient = LinearGradient(
    colors: AppColors.primaryGradient,
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // Gradient for the "My dashboard" card
  static const LinearGradient dashboardCardGradient = LinearGradient(
    colors: AppColors.dashboardGradient,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Gradient for the "Become a PRO trader" card
  static const LinearGradient proTraderCardGradient = LinearGradient(
    colors: AppColors.proTraderGradient,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const TextTheme textTheme = TextTheme(
    headlineLarge: TextStyle(
      fontFamily: 'Encode Sans',
      color: AppColors.textPrimary,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    titleMedium: TextStyle(
      fontFamily: 'Inter',
      color: AppColors.textPrimary,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontFamily: 'Inter',
      color: AppColors.textSecondary,
      fontSize: 14,
      height: 1.5,
    ),
  );
}
