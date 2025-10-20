import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreForYouSheet extends StatelessWidget {
  final Animation<double> contentAnimation;

  const MoreForYouSheet({super.key, required this.contentAnimation, v});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
      ),
      child: SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: const BoxDecoration(
            color: Color(0xFF1C2127),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
              bottom: Radius.circular(24),
            ),
          ),
          child: FadeTransition(
            opacity: contentAnimation,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: ListView(
                    children: const [
                      _Section(
                        title: 'Trade',
                        items: [
                          _ActionItem(
                            icon: Icons.add_shopping_cart,
                            title: 'Buy',
                            svgIcon: "assets/icons/orbIce.svg",
                          ),
                          _ActionItem(
                            icon: Icons.sell_outlined,
                            title: 'Sell',
                            svgIcon: "assets/icons/orbIce.svg",
                          ),
                          _ActionItem(
                            icon: Icons.swap_horiz,
                            title: 'Swap',
                            svgIcon: "assets/icons/orbIce.svg",
                          ),
                          _ActionItem(
                            icon: Icons.send,
                            title: 'Send',
                            svgIcon: "assets/icons/orbIce.svg",
                          ),
                          _ActionItem(
                            icon: Icons.call_received,
                            title: 'Receive',
                            svgIcon: "assets/icons/orbIce.svg",
                          ),
                          _ActionItem(
                            icon: Icons.trending_up,
                            title: 'Invest',
                            isNew: true,
                            svgIcon: "assets/icons/orbIce.svg",
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      _Section(
                        title: 'Earn',
                        items: [
                          _ActionItem(
                            icon: Icons.rocket_launch_outlined,
                            title: 'Roqq\'n\'roll',
                            isNew: true,
                            svgIcon: "assets/icons/orbIce.svg",
                          ),
                          _ActionItem(
                            icon: Icons.savings_outlined,
                            title: 'Savings',
                            svgIcon: "assets/icons/buy2.svg",
                          ),
                          _ActionItem(
                            icon: Icons.military_tech_outlined,
                            title: 'Missions',
                            svgIcon: "assets/icons/orbIce.svg",
                          ),
                          _ActionItem(
                            icon: Icons.copy,
                            title: 'Copy trading',
                            isNew: true,
                            svgIcon: "assets/icons/orbIce.svg",
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final List<_ActionItem> items;
  const _Section({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF2D3748),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(children: items),
        ),
      ],
    );
  }
}

class _ActionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isNew;
  final String? svgIcon;
  const _ActionItem({
    required this.icon,
    required this.title,
    this.isNew = false,
    this.svgIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: svgIcon != null
          ? Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                color: Color(0xFF2A2F36),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(svgIcon!),
            )
          : Icon(icon, color: Colors.white70),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w700,
          fontSize: 11,
          color: Colors.white,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isNew)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFFF79009).withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'New',
                style: TextStyle(color: Color(0xFFF79009), fontSize: 12),
              ),
            ),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 13),
        ],
      ),
      onTap: () {},
    );
  }
}
