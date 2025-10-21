import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/providers/main_screen_providers.dart';

class AnimatedMiddleButton extends ConsumerStatefulWidget {
  const AnimatedMiddleButton({
    super.key,
  });

  @override
  ConsumerState<AnimatedMiddleButton> createState() =>
      _AnimatedMiddleButtonState();
}

class _AnimatedMiddleButtonState extends ConsumerState<AnimatedMiddleButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isOverlayVisible = ref.watch(moreForYouVisibilityProvider);

    final bool shouldShowCloseIcon = isOverlayVisible;

    void handleTap() {
      ref.read(moreForYouVisibilityProvider.notifier).toggle();
      _controller.forward().then((_) {
        _controller.reset();
      });
    }

    return SizedBox(
      width: 45.0,
      height: 45.0,
      child: GestureDetector(
        onTap: handleTap,
        child: RotationTransition(
          turns: Tween<double>(begin: 0.0, end: 0.5).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
          ),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF1D3573), Color(0xFF2764FF)],
                end: Alignment.bottomRight,
              ),
            ),
            child: Icon(
              shouldShowCloseIcon ? Icons.close : Icons.add,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}
