import 'package:flutter/material.dart';

class NumericKeyboard extends StatelessWidget {
  final ValueSetter<String> onKeyPressed;

  final VoidCallback onDelete;

  const NumericKeyboard({
    super.key,
    required this.onKeyPressed,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      color: Colors.transparent,
      child: Column(
        children: [
          _buildRow(['1', '2', '3']),
          const SizedBox(height: 16),
          _buildRow(['4', '5', '6']),
          const SizedBox(height: 16),
          _buildRow(['7', '8', '9']),
          const SizedBox(height: 16),
          _buildRow(['.', '0', 'delete']),
        ],
      ),
    );
  }

  Widget _buildRow(List<String> keys) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: keys.map((key) {
        if (key == 'delete') {
          return _buildKey(
            child: const Icon(Icons.backspace_outlined, color: Colors.white70),
            onTap: onDelete,
          );
        } else {
          return _buildKey(
            child: Text(
              key,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () => onKeyPressed(key),
          );
        }
      }).toList(),
    );
  }

  Widget _buildKey({required Widget child, required VoidCallback onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(
          40,
        ), // Make the splash effect circular
        child: Container(height: 60, alignment: Alignment.center, child: child),
      ),
    );
  }
}
