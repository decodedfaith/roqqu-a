// --- Placeholder screens for each tab ---
import 'package:flutter/material.dart';

class PagePlaceholder extends StatelessWidget {
  final String title;
  const PagePlaceholder({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Gradient Background'),
        backgroundColor: Colors.black87,
      ),
      body: Center(
        child: Container(
          width: 390.0,
          height: 166.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),

            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFC0CFFE), Color(0xFFF3DFF4), Color(0xFFF9D8E5)],
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
