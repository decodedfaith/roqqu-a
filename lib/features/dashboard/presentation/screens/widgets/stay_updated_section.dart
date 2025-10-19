import 'package:flutter/material.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/widgets/bell_icon_with_dot.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/widgets/notification_card.dart';

class StayUpdatedSection extends StatefulWidget {
  const StayUpdatedSection({super.key});

  @override
  State<StayUpdatedSection> createState() => StayUpdatedSectionState();
}

class StayUpdatedSectionState extends State<StayUpdatedSection> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
    _pageController.addListener(() {
      if (_pageController.page != null) {
        setState(() {
          _currentPage = _pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 80,
          child: PageView(
            physics: const BouncingScrollPhysics(),
            padEnds: false,
            controller: _pageController,
            children: [
              _buildPage(
                const NotificationCard(
                  icon: BellIconWithDot(
                    svgIcon: "assets/icons/notification.svg",
                    blackOutline: false,
                  ),
                  title: 'Delisting coins',
                  subtitle: 'View the list of coins we are delisting',
                  showBadge: true,
                ),
              ),
              _buildPage(
                const NotificationCard(
                  svgIcon: 'assets/icons/coin_swap.svg',
                  title: 'New Feature',
                  subtitle: 'Coin Swap is now available for all users',
                ),
              ),
              _buildPage(
                const NotificationCard(
                  icon: BellIconWithDot(
                    svgIcon: "assets/icons/notification.svg",
                    blackOutline: false,
                  ),
                  title: 'Delisting coins',
                  subtitle: 'View the list of coins we are delisting',
                  showBadge: true,
                ),
              ),
              _buildPage(
                const NotificationCard(
                  icon: Icon(Icons.swap_horiz, color: Colors.blueAccent),
                  title: 'New Feature',
                  subtitle: 'Coin Swap is now available for all users',
                ),
              ),
              _buildPage(
                const NotificationCard(
                  icon: BellIconWithDot(
                    svgIcon: "assets/icons/notification.svg",
                    blackOutline: false,
                  ),
                  title: 'Delisting coins',
                  subtitle: 'View the list of coins we are delisting',
                  showBadge: true,
                ),
              ),
              _buildPage(
                const NotificationCard(
                  icon: Icon(Icons.swap_horiz, color: Colors.blueAccent),
                  title: 'New Feature',
                  subtitle: 'Coin Swap is now available for all users',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        _PageIndicators(itemCount: 6, currentIndex: _currentPage),
      ],
    );
  }

  // Helper method to add padding to each page
  Widget _buildPage(Widget child) {
    return Padding(padding: const EdgeInsets.only(right: 16), child: child);
  }
}

// A widget to build the page indicator dots
class _PageIndicators extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  const _PageIndicators({required this.itemCount, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          height: 5.0,
          width: currentIndex == index ? 5.5 : 5.0, // Active dot is wider
          decoration: BoxDecoration(
            color: currentIndex == index ? Colors.white : Colors.white38,
            borderRadius: BorderRadius.circular(13),
          ),
        );
      }),
    );
  }
}
