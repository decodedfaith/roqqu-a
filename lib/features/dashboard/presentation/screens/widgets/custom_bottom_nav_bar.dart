import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/providers/main_screen_providers.dart';
import 'animated_middle_button.dart';

class CustomBottomNavBar extends ConsumerWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 85,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                border: Border(
                  top: BorderSide(
                    // ignore: deprecated_member_use
                    color: Colors.grey.withOpacity(0.2),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    ref,
                    assetName: 'assets/icons/home.svg',
                    label: 'Home',
                    index: 0,
                    hasNotification: true,
                  ),
                  _buildNavItem(
                    ref,
                    assetName: 'assets/icons/fintech_wallet.svg',
                    label: 'Wallet',
                    index: 1,
                  ),
                  const SizedBox(width: 40),
                  _buildNavItem(
                    ref,
                    assetName: 'assets/icons/transaction.svg',
                    label: 'History',
                    index: 2,
                  ),
                  _buildNavItem(
                    ref,
                    assetName: 'assets/icons/profile.svg',
                    label: 'Profile',
                    index: 3,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 22,
            left: MediaQuery.of(context).size.width / 2 - 23,
            child: const AnimatedMiddleButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    WidgetRef ref, {
    required String assetName,
    required String label,
    required int index,
    bool hasNotification = false,
  }) {
    final selectedIndex = ref.watch(mainScreenIndexProvider);
    final isSelected = selectedIndex == index;

    const Color activeColor = Colors.blueAccent;
    const Color inactiveColor = Colors.grey;

    final Widget iconWidget = SvgPicture.asset(
      assetName,
      width: 24,
      height: 24,
      colorFilter: ColorFilter.mode(
        isSelected ? activeColor : inactiveColor,
        BlendMode.srcIn,
      ),
    );

    return GestureDetector(
      onTap: () {
        ref.read(mainScreenIndexProvider.notifier).setIndex(index);
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (hasNotification)
            Stack(
              clipBehavior: Clip.none,
              children: [
                iconWidget,
                Positioned(
                  top: 0,
                  right: -1,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF1A1A1A),
                        width: 3,
                      ),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 11,
                      minHeight: 11,
                    ),
                  ),
                ),
              ],
            )
          else
            iconWidget,
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? activeColor : inactiveColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
