import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TraderAvatar extends StatelessWidget {
  final String initials;
  final Color backgroundColor;
  final Color? ringColor;
  final bool isProTrader;
  final double radius;

  const TraderAvatar({
    super.key,
    required this.initials,
    this.backgroundColor = const Color(0xFF4A4A4A),
    this.ringColor,
    this.isProTrader = false,
    this.radius = 12.0,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        if (ringColor != null)
          CircleAvatar(
            radius: radius + 2,
            backgroundColor: ringColor,
          ),
        CircleAvatar(
          radius: radius,
          backgroundColor: backgroundColor,
          child: Text(
            initials,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: radius * 0.8,
            ),
          ),
        ),
        if (isProTrader)
          Positioned(
            right: -4,
            bottom: -4,
            child: SvgPicture.asset(
              'assets/icons/proIcon.svg',
              width: radius,
              height: radius,
            ),
          ),
      ],
    );
  }
}
