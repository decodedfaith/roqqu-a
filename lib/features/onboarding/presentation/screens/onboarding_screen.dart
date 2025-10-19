import 'package:flutter/material.dart';
import 'package:roqqu_mobile_t/common/widgets/main_gradient_button.dart';
import 'package:roqqu_mobile_t/core/theme/app_theme.dart';
import 'package:roqqu_mobile_t/features/onboarding/presentation/widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDark,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: const [
                  OnboardingPage(
                    assetPath:
                        'assets/animations/robot.riv', // Your Rive animation
                    title: 'Copy PRO traders',
                    description:
                        'Leverage expert strategies from professional traders to boost your success.',
                  ),
                  OnboardingPage(
                    assetPath:
                        'assets/images/chart_illustration.png', // A static image
                    title: 'Do less, Win more',
                    description:
                        'Streamline your approach to trading and increase your winning potential effortlessly.',
                  ),
                ],
              ),
            ),

            _PageIndicators(
              pageCount: 2, // The total number of pages
              currentPage: _currentPage,
            ),
            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: MainGradientButton(
                text: 'Get started',
                onPressed: () {
                  // TODO: Navigate to RiskLevelScreen
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PageIndicators extends StatelessWidget {
  final int pageCount;
  final int currentPage;

  const _PageIndicators({required this.pageCount, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pageCount, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          height: 8.0,
          width: currentPage == index ? 24.0 : 8.0,
          decoration: BoxDecoration(
            color: currentPage == index ? Colors.white : Colors.white38,
            borderRadius: BorderRadius.circular(12),
          ),
        );
      }),
    );
  }
}
