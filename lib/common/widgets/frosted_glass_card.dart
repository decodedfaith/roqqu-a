import 'dart:ui';
import 'package:flutter/material.dart';

class FrostedGlassCard extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double height;
  final double width;
  final VoidCallback? onTap;

  const FrostedGlassCard({
    super.key,
    required this.child,
    required this.gradient,
    this.height = 118,
    this.width = 171,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: gradient,
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
