import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:roqqu_mobile_t/common/widgets/custom_app_bar.dart';
import 'package:roqqu_mobile_t/common/widgets/numeric_keyboard.dart';
import 'package:roqqu_mobile_t/core/router/app_router.dart';
import 'package:roqqu_mobile_t/core/theme/app_theme.dart';

class EnterPinScreen extends StatefulWidget {
  const EnterPinScreen({super.key});

  @override
  State<EnterPinScreen> createState() => _EnterPinScreenState();
}

class _EnterPinScreenState extends State<EnterPinScreen> {
  // A controller to manage the text being entered into the PIN field.
  late final TextEditingController _pinController;
  // A FocusNode to control the focus of the PIN field.
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _pinController = TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  // --- Input Handlers ---
  void _onKeyPressed(String value) {
    if (_pinController.text.length < 6) {
      _pinController.text += value;
    }
  }

  void _onDelete() {
    if (_pinController.text.isNotEmpty) {
      _pinController.text =
          _pinController.text.substring(0, _pinController.text.length - 1);
    }
  }

  void _onPinCompleted(String pin) {
    // In a real app, you would verify the PIN here with an API call.
    // await ref.read(authProvider.notifier).verifyPin(pin);

    // print('PIN entered: $pin');

    // For this assessment, we'll just simulate success and navigate.
    // Use `context.go` to replace the entire stack with the success screen.
    context.go(AppRoutes.copySuccess);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDark,
      appBar: const CustomAppBar(title: 'Confirm transaction'),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.shield_outlined,
                    color: Colors.amber, size: 40),
                const SizedBox(height: 16),
                const Text(
                  'Confirm Transaction',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  'Input your 6 digit transaction PIN to confirm\nyour transaction and authenticate your request.',
                  style: AppTheme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // --- The Pinput Widget ---
                Pinput(
                  length: 6,
                  controller: _pinController,
                  focusNode: _focusNode,
                  readOnly: true, // We will control it with our custom keyboard
                  autofocus: true,
                  obscureText: true,
                  obscuringCharacter: '●',
                  onCompleted: _onPinCompleted,
                  defaultPinTheme: _buildPinTheme(),
                  focusedPinTheme:
                      _buildPinTheme(borderColor: Colors.blueAccent),
                  submittedPinTheme:
                      _buildPinTheme(borderColor: AppTheme.accentGreen),
                ),
                const SizedBox(height: 24),
                TextButton(
                  onPressed: () {},
                  child: const Text('Forgot PIN?',
                      style: TextStyle(color: Colors.blueAccent)),
                ),
              ],
            ),
          ),
          // --- Your Reusable Numeric Keyboard ---
          NumericKeyboard(
            onKeyPressed: _onKeyPressed,
            onDelete: _onDelete,
          ),
        ],
      ),
    );
  }

  /// Helper method to define the styling for the PIN input boxes.
  PinTheme _buildPinTheme({Color? borderColor}) {
    return PinTheme(
      width: 16,
      height: 16,
      textStyle: const TextStyle(
          fontSize: 9, color: Colors.white, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        border: Border.all(
            // ignore: deprecated_member_use
            color: borderColor ?? AppTheme.cardDark.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
