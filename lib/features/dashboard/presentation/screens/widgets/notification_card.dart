import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget? icon;
  final String? svgIcon;
  final bool showBadge;

  const NotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
    this.svgIcon,
    this.showBadge = false,
  })  : assert(svgIcon != null || icon != null),
        assert(svgIcon == null || icon == null);

  @override
  Widget build(BuildContext context) {
    Widget? iconWidget;

    if (svgIcon != null && svgIcon!.isNotEmpty) {
      iconWidget = SvgPicture.asset(svgIcon!, width: 20, height: 20);
    } else if (icon != null) {
      iconWidget = icon;
    }
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
      decoration: BoxDecoration(
        color: const Color(0xFF20252B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF262932), width: 1),
      ),
      child: Row(
        children: [
          if (iconWidget != null) ...[iconWidget, const SizedBox(width: 16)],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Encode Sans',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.white70,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          if (showBadge)
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [_UrgentNoticeBadge()],
            ),
        ],
      ),
    );
  }
}

class _UrgentNoticeBadge extends StatelessWidget {
  const _UrgentNoticeBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: const Color(0xFFFF554A).withOpacity(0.08),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
      ),
      child: const Text(
        'Urgent Notice',
        style: TextStyle(
          fontFamily: 'Inter',
          color: Color(0xFFFF554A),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
