import 'package:flutter/material.dart';
import 'package:roqqu_mobile_t/core/theme/colors.dart';

class AppTypography {
  static const String fontFamilyEncodeSans = 'Encode Sans';
  static const String fontFamilyInter = 'Inter';

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: fontFamilyEncodeSans,
    fontWeight: FontWeight.w900,
    fontSize: 24,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontFamilyEncodeSans,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    color: AppColors.textBlack,
    height: 1.5,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontFamilyEncodeSans,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: AppColors.textSecondary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamilyInter,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamilyInter,
    fontWeight: FontWeight.w400,
    fontSize: 11,
    color: AppColors.textAccent,
  );

  static const TextStyle buttonLabel = TextStyle(
    fontFamily: fontFamilyInter,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  static const TextStyle cryptoLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppColors.textBlack,
  );
}
