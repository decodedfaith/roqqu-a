import 'package:flutter/material.dart';

class BalanceSection extends StatefulWidget {
  const BalanceSection({super.key});

  @override
  State<BalanceSection> createState() => _BalanceSectionState();
}

class _BalanceSectionState extends State<BalanceSection> {
  bool _isBalanceVisible = true;

  void _toggleVisibility() {
    setState(() {
      _isBalanceVisible = !_isBalanceVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Your GBP Balance',
              style: TextStyle(color: Color(0xFFA7B1BC), fontSize: 12),
            ),
            SizedBox(
              child: IconButton(
                iconSize: 14,
                icon: Icon(
                  _isBalanceVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Color(0xFFA7B1BC),
                ),
                onPressed: _toggleVisibility,
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
              ),
            ),
          ],
        ),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: _isBalanceVisible
              ? RichText(
                  key: const ValueKey<String>('visible_balance'),
                  text: TextSpan(
                    style: const TextStyle(
                      fontFamily: 'Encode Sans',
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w800,
                      fontSize: 32,
                      height: 1.25,
                    ),
                    children: <TextSpan>[
                      const TextSpan(text: '£0'),
                      const TextSpan(
                        text: '.00',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          height: 1.33,
                        ),
                      ),
                    ],
                  ),
                )
              : const Text(
                  '£**,***.**',
                  key: ValueKey<String>('hidden_balance'),
                  style: TextStyle(
                    fontFamily: 'Encode Sans',
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.w800,
                    fontSize: 32,
                    height: 1.25,
                  ),
                ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
