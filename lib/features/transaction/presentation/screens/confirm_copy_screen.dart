import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_mobile_t/common/widgets/custom_app_bar.dart';
import 'package:roqqu_mobile_t/common/widgets/main_gradient_button.dart';
import 'package:roqqu_mobile_t/core/router/app_router.dart';
import 'package:roqqu_mobile_t/core/theme/app_theme.dart';

class ConfirmCopyScreen extends StatelessWidget {
  const ConfirmCopyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDark,
      appBar: const CustomAppBar(title: 'Confirm transaction'),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // const Spacer(),
            const CircleAvatar(radius: 40, child: Text('🇺🇸')),
            const SizedBox(height: 16),
            Text('Copy trading amount', style: AppTheme.textTheme.bodyMedium),
            const SizedBox(height: 8),
            const Text('100 USD',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            const SizedBox(height: 32),
            const Divider(
              color: Colors.white24,
              thickness: 0.2,
            ),
            _buildInfoRow('PRO trader', 'BTC master'),
            const Divider(
              color: Colors.white24,
              thickness: 0.2,
            ),
            _buildInfoRow('What you get', '99 USD'),
            const Divider(
              color: Colors.white24,
              thickness: 0.2,
            ),
            _buildInfoRow('Transaction fee', '1.00 USD'),
            const Spacer(flex: 2),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
          child: MainGradientButton(
            text: 'Confirm transaction',
            onPressed: () => context.push(AppRoutes.enterPin),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTheme.textTheme.bodyMedium),
          Text(value,
              style: AppTheme.textTheme.titleMedium
                  ?.copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}
