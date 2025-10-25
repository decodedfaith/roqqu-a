import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_mobile_t/common/widgets/main_gradient_button.dart';
import 'package:roqqu_mobile_t/core/router/app_router.dart';
import 'package:roqqu_mobile_t/core/theme/app_theme.dart';

class ImportantMessageSheet extends StatefulWidget {
  const ImportantMessageSheet({super.key});
  @override
  State<ImportantMessageSheet> createState() => _ImportantMessageSheetState();
}

class _ImportantMessageSheetState extends State<ImportantMessageSheet> {
  bool _isChecked = false;
  void _onProceed() {
    if (!_isChecked) return;
    Navigator.of(context).pop();
    context.push(AppRoutes.risks);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
      decoration: const BoxDecoration(
        color: AppTheme.primaryDark,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade700,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 24),
          const SizedBox(
              height: 120,
              child: Center(
                  child: Icon(Icons.security,
                      color: Colors.blueAccent, size: 60))),
          const SizedBox(height: 16),
          Text(
            'Important message!',
            style: AppTheme.textTheme.headlineLarge?.copyWith(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            "Don't invest unless you're prepared to lose all the money you invest. Please understand the risks involved in copy trading.",
            style: AppTheme.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: () => setState(() => _isChecked = !_isChecked),
            child: Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) =>
                      setState(() => _isChecked = value ?? false),
                  activeColor: Colors.blueAccent,
                  checkColor: AppTheme.primaryDark,
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: AppTheme.textTheme.bodyMedium,
                      children: [
                        const TextSpan(
                            text:
                                'Check this box to agree to Roqqu\'s copy trading '),
                        TextSpan(
                          text: 'policy',
                          style: const TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {/* Open policy URL */},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          MainGradientButton(
            text: 'Proceed to copy trade',
            onPressed: _isChecked ? _onProceed : () {},
          ),
          const SizedBox(
            height: 45,
          )
        ],
      ),
    );
  }
}
