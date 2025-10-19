import 'package:flutter/material.dart';
import 'package:roqqu_mobile_t/core/theme/app_theme.dart';

class MainGradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MainGradientButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: AppTheme.primaryGradient,
        ),
        child: Center(
          child: Text(
            text,
            style: AppTheme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
