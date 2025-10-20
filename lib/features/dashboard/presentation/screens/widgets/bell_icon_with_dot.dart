// A simple widget for the bell icon with the red dot
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BellIconWithDot extends StatelessWidget {
  final Widget? icon;
  final String? svgIcon;
  final bool blackOutline;

  const BellIconWithDot({
    super.key,
    this.icon,
    this.svgIcon,
    required this.blackOutline,
  })  : assert(svgIcon != null || icon != null),
        assert(svgIcon == null || icon == null);

  @override
  Widget build(BuildContext context) {
    Widget? iconWidget;

    SvgTheme theme = blackOutline == true
        ? const SvgTheme(currentColor: Color(0xFF1C2127))
        : const SvgTheme();

    if (svgIcon != null && svgIcon!.isNotEmpty) {
      iconWidget = SvgPicture.asset(
        svgIcon!,
        theme: theme,
        // width: 14,
        // height: 18,
      );
    } else if (icon != null) {
      iconWidget = icon;
    }
    return Stack(
      clipBehavior: Clip.none,
      children: [
        iconWidget!,
        Positioned(
          top: -3,
          right: 1,
          child: Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
