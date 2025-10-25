import 'package:flutter/material.dart';
import 'package:roqqu_mobile_t/common/widgets/custom_app_bar.dart';
import 'package:roqqu_mobile_t/common/widgets/main_gradient_button.dart';
import 'package:roqqu_mobile_t/core/theme/app_theme.dart';

class RisksScreen extends StatelessWidget {
  const RisksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDark,
      appBar: const CustomAppBar(title: 'Risks'),
      body: ListView(
        padding: const EdgeInsets.all(24.0),
        children: [
          Text(
            'Risks involved in copy trading',
            style: AppTheme.textTheme.headlineLarge?.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 8),
          Text(
            'Please make sure you read the following risks involved in copy trading before making a decision.',
            style: AppTheme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          const _RiskExpansionTile(
            title: 'Market risks',
            content:
                'All investments carry risks, including potential loss of capital.',
          ),
          const _RiskExpansionTile(
              title: 'Dependency on others', content: '...'),
          const _RiskExpansionTile(
              title: 'Mismatched risk profiles', content: '...'),
          const _RiskExpansionTile(
              title: 'Control and understanding', content: '...'),
          const _RiskExpansionTile(
              title: 'Emotional decisions', content: '...'),
          const _RiskExpansionTile(title: 'Costs involved', content: '...'),
          const _RiskExpansionTile(title: 'Diversify', content: '...'),
          const _RiskExpansionTile(title: 'Execution risks', content: '...'),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
          child: MainGradientButton(
            text: 'I have read the risks',
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}

// A custom, reusable expansion tile to match the design.
class _RiskExpansionTile extends StatefulWidget {
  final String title;
  final String content;
  const _RiskExpansionTile({required this.title, required this.content});

  @override
  State<_RiskExpansionTile> createState() => _RiskExpansionTileState();
}

class _RiskExpansionTileState extends State<_RiskExpansionTile> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(widget.title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            trailing: Icon(
              _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Colors.white70,
            ),
            onTap: () => setState(() => _isExpanded = !_isExpanded),
          ),
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(widget.content,
                  style: const TextStyle(color: AppTheme.textLight)),
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}
