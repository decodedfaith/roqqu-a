import 'package:flutter/material.dart';
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
  int? _selectedLevel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDark,
      appBar: const CustomAppBar(title: 'Copy trading'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What risk level are you comfortable exploring?',
              style: AppTheme.textTheme.headlineLarge,
            ),
            const SizedBox(height: 24),
            RiskLevelCard(
              title: 'Conservative profile',
              description: '...',
              isSelected: _selectedLevel == 0,
              onTap: () => setState(() => _selectedLevel = 0),
            ),
            // ... Other RiskLevelCards ...
            const Spacer(),
            MainGradientButton(
              text: 'Proceed',
              onPressed: () {
                // TODO: Navigate to Pro Traders Dashboard
              },
            ),
          ],
        ),
      ),
    );
  }
}
