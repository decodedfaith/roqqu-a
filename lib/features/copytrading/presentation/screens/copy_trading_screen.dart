import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_mobile_t/common/widgets/main_gradient_button.dart';
import 'package:roqqu_mobile_t/core/router/app_router.dart';
import 'package:roqqu_mobile_t/core/theme/app_theme.dart';
import 'package:roqqu_mobile_t/features/copytrading/presentation/widgets/copy_trading_page.dart';

class CopyTradingScreen extends StatefulWidget {
  const CopyTradingScreen({super.key});

  @override
  State<CopyTradingScreen> createState() => _CopyTradingScreennState();
}

class _CopyTradingScreennState extends State<CopyTradingScreen> {
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            }
          },
        ),
        title: Text(
          'Copy trading',
          style: AppTheme.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            _PageIndicators(
              pageCount: 2,
              currentPage: _currentPage,
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: const [
                  CopyTradingPage(
                    assetPath:
                        'assets/icons/intro2.svg', //TODO: Your Rive animation
                    title: 'Copy PRO traders',
                    description:
                        'Leverage expert strategies from professional traders to boost your success.',
                  ),
                  CopyTradingPage(
                    assetPath: 'assets/icons/intro1.svg', //TODO: A static image
                    title: 'Do less, Win more',
                    description:
                        'Streamline your approach to trading and increase your winning potential effortlessly.',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: MainGradientButton(
          text: 'Get started',
          onPressed: () {
            context.push('/home${AppRoutes.riskAssessment}');
          },
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
          height: 2.0,
          width: currentPage == index ? 175.0 : 175.0,
          decoration: BoxDecoration(
            color: currentPage == index
                ? const Color(0xFF85D1F0)
                : const Color(0xFF262932),
            borderRadius: BorderRadius.circular(12),
          ),
        );
      }),
    );
  }
}
