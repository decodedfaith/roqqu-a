import 'package:flutter/material.dart';
import 'package:rive/rive.dart' as rive; // Import Rive for animations
import 'package:roqqu_mobile_t/core/theme/app_theme.dart';

class OnboardingPage extends StatefulWidget {
  final String assetPath;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.assetPath,
    required this.title,
    required this.description,
  });

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<Offset> _contentAnimation;

  @override
  void initState() {
    super.initState();
    // Animation for the text content
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _contentAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    // Play the animation when the page is built
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),

          // --- The Illustration ---
          // It checks if the asset is a Rive animation or a static image
          SizedBox(
            width: 270,
            height: 210,
            child: widget.assetPath.endsWith('.riv')
                ? rive.RiveAnimation.asset(
                    widget.assetPath,
                    fit: BoxFit.contain,
                  )
                : Image.asset(widget.assetPath, fit: BoxFit.contain),
          ),

          const Spacer(flex: 1),

          // --- The Animated Text Content ---
          SlideTransition(
            position: _contentAnimation,
            child: FadeTransition(
              opacity: _controller,
              child: Column(
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: AppTheme.textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    widget.description,
                    textAlign: TextAlign.center,
                    style: AppTheme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              /* TODO: Implement video player */
            },
            child: Text(
              'Watch a how to video',
              style: AppTheme.textTheme.bodyMedium?.copyWith(
                color: Colors.white70,
              ),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
