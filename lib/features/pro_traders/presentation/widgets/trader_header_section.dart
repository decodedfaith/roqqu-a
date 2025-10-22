import 'package:flutter/material.dart';
import 'package:roqqu_mobile_t/common/widgets/trader_avater.dart';
import 'package:roqqu_mobile_t/core/theme/app_theme.dart';
import 'package:roqqu_mobile_t/features/pro_traders/domain/models/pro_trader.dart';

class TraderHeaderSection extends StatelessWidget {
  final ProTrader trader;
  const TraderHeaderSection({super.key, required this.trader});

  @override
  Widget build(BuildContext context) {
    const Color backgroundColor = Colors.red;
    const Color ringColor = Colors.blue;
    return Column(
      children: [
        Row(
          children: [
            TraderAvatar(
              initials: trader.initials,
              backgroundColor: backgroundColor,
              ringColor: ringColor,
              isProTrader: trader.isPro,
              radius: 24,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(trader.name,
                    style: AppTheme.textTheme.titleMedium
                        ?.copyWith(color: Colors.white)),
                Row(
                  children: [
                    const Icon(Icons.person_outline,
                        color: AppTheme.textLight, size: 16),
                    const SizedBox(width: 4),
                    Text('${trader.copiers} Copiers',
                        style: AppTheme.textTheme.bodyMedium),
                  ],
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _InfoChip(text: '${1} trading days'),
            _InfoChip(text: '${2}% profit-share'),
            _InfoChip(text: '${3} total orders'),
          ],
        )
      ],
    );
  }
}

class _InfoChip extends StatelessWidget {
  final String text;
  const _InfoChip({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: AppTheme.cardDark.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: AppTheme.textTheme.bodyMedium?.copyWith(
          fontSize: 12,
          color: AppTheme.textLight,
        ),
      ),
    );
  }
}
