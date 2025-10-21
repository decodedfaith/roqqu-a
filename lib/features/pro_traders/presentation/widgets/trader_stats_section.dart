import 'package:flutter/material.dart';
import 'package:roqqu_mobile_t/core/theme/app_theme.dart';

//TODO:  In a real app, this data would come from your ProTrader model, passed into this widget.
// For now, we use mock data to build the UI.
const mockStatsData = {
  'tradingDays': '43',
  'profitShare': '15%',
  'totalOrders': '56',
  'avgRoi': '+10.5%',
  'avgLoss': '-2.1%',
  'tradingPairs': 'BTC/USDT, ETH/USDT',
};

class TraderStatsSection extends StatelessWidget {
  const TraderStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      child: Column(
        children: [
          const _StatGrid(stats: mockStatsData),
          const SizedBox(height: 14),
          _StatCard(
            title: 'Trading pairs',
            child: Text(
              mockStatsData['tradingPairs']!,
              style: AppTheme.textTheme.bodyMedium?.copyWith(
                color: AppTheme.textLight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatGrid extends StatelessWidget {
  final Map<String, String> stats;
  const _StatGrid({required this.stats});

  @override
  Widget build(BuildContext context) {
    return _StatCard(
      title: 'Statistics',
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 24,
        crossAxisSpacing: 16,
        childAspectRatio: 2.0,
        children: [
          _StatItem(title: 'Trading days', value: stats['tradingDays']!),
          _StatItem(title: 'Profit share', value: stats['profitShare']!),
          _StatItem(title: 'Total orders', value: stats['totalOrders']!),
          _StatItem(
              title: 'Avg. ROI',
              value: stats['avgRoi']!,
              valueColor: AppTheme.accentGreen),
          _StatItem(
              title: 'Avg. losses',
              value: stats['avgLoss']!,
              valueColor: Colors.redAccent),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String title;
  final String value;
  final Color? valueColor;

  const _StatItem({
    required this.title,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTheme.textTheme.bodyMedium?.copyWith(
            color: AppTheme.textLight,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          value,
          style: AppTheme.textTheme.titleMedium?.copyWith(
            color: valueColor ?? Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _StatCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.textTheme.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          child,
        ],
      ),
    );
  }
}
