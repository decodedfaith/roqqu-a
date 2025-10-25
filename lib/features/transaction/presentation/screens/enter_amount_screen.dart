import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_mobile_t/common/widgets/custom_app_bar.dart';
import 'package:roqqu_mobile_t/common/widgets/main_gradient_button.dart';
import 'package:roqqu_mobile_t/common/widgets/numeric_keyboard.dart';
import 'package:roqqu_mobile_t/core/router/app_router.dart';
import 'package:roqqu_mobile_t/core/theme/app_theme.dart';

class EnterAmountScreen extends StatefulWidget {
  const EnterAmountScreen({super.key});
  @override
  State<EnterAmountScreen> createState() => _EnterAmountScreenState();
}

class _EnterAmountScreenState extends State<EnterAmountScreen> {
  // Use a TextEditingController for more robust text management
  final TextEditingController _amountController =
      TextEditingController(text: "100.00");
  final double _balance = 240.73;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _onKeyPressed(String value) {
    // This logic prevents multiple decimals and handles initial input
    final currentText = _amountController.text;
    if (value == '.') {
      if (!currentText.contains('.')) {
        _amountController.text = '$currentText.';
      }
      return;
    }
    if (currentText == "0.00" || currentText == "100.00") {
      _amountController.text = value;
    } else {
      _amountController.text += value;
    }
  }

  void _onDelete() {
    final currentText = _amountController.text;
    if (currentText.isNotEmpty) {
      _amountController.text = currentText.substring(0, currentText.length - 1);
      if (_amountController.text.isEmpty) {
        _amountController.text = "0.00";
      }
    }
  }

  void _useMax() {
    _amountController.text = _balance.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    // Listen to the controller to update the UI
    return ListenableBuilder(
      listenable: _amountController,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppTheme.primaryDark,
          appBar: const CustomAppBar(title: 'Enter amount'),
          body: Column(
            children: [
              const Spacer(), // Pushes the amount display down

              // --- Main Amount Display ---
              Text(
                '${_amountController.text} USD',
                style: AppTheme.textTheme.headlineLarge?.copyWith(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),

              // --- Transaction Fee Display ---
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.cardDark,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Transaction fee (1%) - 1.00USD',
                  style: TextStyle(color: AppTheme.textLight, fontSize: 12),
                ),
              ),

              const Spacer(
                  flex:
                      2), // Takes up twice the space to push everything else down

              // --- USD Balance and Use Max Button ---
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: AppTheme.cardDark,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'USD Balance\n\$${_balance.toStringAsFixed(2)}',
                      style:
                          AppTheme.textTheme.bodyMedium?.copyWith(height: 1.5),
                    ),
                    // Use a more styled button for "Use Max"
                    TextButton(
                      onPressed: _useMax,
                      style: TextButton.styleFrom(
                        // ignore: deprecated_member_use
                        backgroundColor: AppTheme.primaryDark.withOpacity(0.8),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Use Max'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // --- Continue Button ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: MainGradientButton(
                  text: 'Continue',
                  onPressed: () => context.push(AppRoutes.confirmCopy),
                ),
              ),
              const SizedBox(height: 24),

              // --- Numeric Keyboard ---
              NumericKeyboard(
                onKeyPressed: _onKeyPressed,
                onDelete: _onDelete,
              ),
            ],
          ),
        );
      },
    );
  }
}
