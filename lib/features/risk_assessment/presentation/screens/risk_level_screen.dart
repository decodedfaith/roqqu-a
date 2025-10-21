import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_mobile_t/common/widgets/custom_app_bar.dart';
import 'package:roqqu_mobile_t/common/widgets/main_gradient_button.dart';
import 'package:roqqu_mobile_t/common/widgets/risk_level_card.dart';
import 'package:roqqu_mobile_t/core/theme/app_theme.dart';

class RiskLevelScreen extends StatefulWidget {
  const RiskLevelScreen({super.key});

  @override
  State<RiskLevelScreen> createState() => _RiskLevelScreenState();
}

class _RiskLevelScreenState extends State<RiskLevelScreen> {
  int _selectedLevel = 0; // Default to 'Conservative'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDark,
      appBar: const CustomAppBar(title: 'Copy trading'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What risk level are you comfortable exploring?',
              style: AppTheme.textTheme.headlineLarge,
            ),
            const SizedBox(height: 8),
            const Text(
              'Choose a level',
            ),
            const SizedBox(height: 32),
            RiskLevelCard(
              title: 'Conservative profile',
              description:
                  'Conservative profile involves stable returns from proven strategies with minimal volatility.',
              isSelected: _selectedLevel == 0,
              onTap: () => setState(() => _selectedLevel = 0),
            ),
            RiskLevelCard(
              title: 'Steady growth profile',
              description:
                  'Steady growth involves balanced gains with moderate fluctuations in strategy performance.',
              isSelected: _selectedLevel == 1,
              onTap: () => setState(() => _selectedLevel = 1),
            ),
            RiskLevelCard(
              title: 'Exponential growth profile',
              description:
                  'It has potentials for significant gains or losses due to aggressive trading and market exposure.',
              isSelected: _selectedLevel == 2,
              onTap: () => setState(() => _selectedLevel = 2),
            ),
            const Spacer(),
            MainGradientButton(
              text: 'Proceed',
              onPressed: () => context.go('/home/pro-traders'),
            ),
          ],
        ),
      ),
    );
  }
}
