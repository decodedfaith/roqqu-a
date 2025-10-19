import 'package:flutter/material.dart';
import 'package:roqqu_mobile_t/common/widgets/custom_app_bar.dart';
import 'package:roqqu_mobile_t/common/widgets/numeric_keyboard.dart';
import 'package:roqqu_mobile_t/core/theme/app_theme.dart';

class ConfirmTransactionScreen extends StatelessWidget {
  const ConfirmTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDark,
      appBar: const CustomAppBar(title: 'Confirm Transaction'),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Confirm Transaction',
                  style: AppTheme.textTheme.headlineLarge,
                ),
                SizedBox(height: 8),
                Text(
                  'Input your 6 digit transaction PIN',
                  style: AppTheme.textTheme.bodyMedium,
                ),
                SizedBox(height: 32),
                // TODO: Build the PIN input dots widget (e.g., using the `pinput` package)
              ],
            ),
          ),
          // Your reusable numeric keyboard
          NumericKeyboard(
            onKeyPressed: (value) {
              /* Handle key press */
            },
            onDelete: () {
              /* Handle delete */
            },
          ),
        ],
      ),
    );
  }
}
