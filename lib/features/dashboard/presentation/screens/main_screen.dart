import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/providers/main_screen_providers.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/home_screen.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/widgets/custom_bottom_nav_bar.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/widgets/more_for_you_sheet.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/screens/widgets/page_place_holder.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen>
    with SingleTickerProviderStateMixin {
  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    PagePlaceholder(title: 'Wallet Page'),
    PagePlaceholder(title: 'History Page'),
    PagePlaceholder(title: 'Profile Page'),
  ];

  late final AnimationController _animationController;
  late final Animation<double> _containerScaleAnimation;
  late final Animation<double> _containerFadeAnimation;
  late final Animation<double> _contentFadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _containerScaleAnimation = Tween<double>(begin: 0.2, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOutCubic),
      ),
    );
    _containerFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
    );

    _contentFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isOverlayVisible = ref.watch(moreForYouVisibilityProvider);
    ref.listen<bool>(moreForYouVisibilityProvider, (previous, next) {
      if (next) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });

    return PopScope(
      canPop: !isOverlayVisible,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && isOverlayVisible) {
          ref.read(moreForYouVisibilityProvider.notifier).hide();
        }
      },
      child: Scaffold(
        extendBody: true,
        body: Stack(
          children: [
            _pages[ref.watch(mainScreenIndexProvider)],
            IgnorePointer(
              ignoring: !isOverlayVisible,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isOverlayVisible ? 1.0 : 0.0,
                child: GestureDetector(
                  onTap: () =>
                      ref.read(moreForYouVisibilityProvider.notifier).hide(),
                  child: Container(color: Colors.black.withValues(alpha: 0.6)),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 16,
              right: 16,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Visibility(
                    visible: _animationController.status !=
                        AnimationStatus.dismissed,
                    child: Transform.scale(
                      scale: _containerScaleAnimation.value,
                      alignment: Alignment.bottomCenter,
                      child: FadeTransition(
                        opacity: _containerFadeAnimation,
                        child: child,
                      ),
                    ),
                  );
                },
                child: MoreForYouSheet(contentAnimation: _contentFadeAnimation),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const CustomBottomNavBar(),
      ),
    );
  }
}
