// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_mobile_t/core/theme/app_theme.dart';
import 'package:roqqu_mobile_t/features/dashboard/domain/models/coin.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/providers/coin_providers.dart';

class ListedCoinsSection extends ConsumerWidget {
  const ListedCoinsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 2. Watch the provider. The UI will now react to its state changes.
    final coinListAsync = ref.watch(coinListProvider);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Listed Coins',
              style: AppTheme.textTheme.titleMedium
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                context.push('/home/all-coins');
              },
              child: const Text(
                'See all',
                style: TextStyle(
                    color: Color(0xFF85D1F0), fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: AppTheme.cardDark,
            borderRadius: BorderRadius.circular(16),
          ),
          child: coinListAsync.when(
            loading: () {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 48.0),
                  child: CircularProgressIndicator(),
                ),
              );
            },
            error: (err, stack) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Error: $err',
                      style: const TextStyle(color: Colors.red)),
                ),
              );
            },
            data: (coins) {
              if (coins.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 48.0),
                    child: Text('Waiting for price updates...',
                        style: TextStyle(color: AppTheme.textLight)),
                  ),
                );
              }
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: coins.length,
                // ignore: deprecated_member_use
                separatorBuilder: (context, index) => Divider(
                    // ignore: deprecated_member_use
                    color: Colors.grey.withOpacity(0.1),
                    height: 1,
                    indent: 16,
                    endIndent: 16),
                itemBuilder: (context, index) {
                  final coin = coins[index];
                  // Use the reusable _CoinListItem widget with animation
                  return TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: Duration(milliseconds: 400 + (index * 100)),
                    curve: Curves.easeOutQuad,
                    builder: (context, value, child) {
                      return Transform.translate(
                        offset: Offset(0, 10 * (1 - value)),
                        child: Opacity(
                          opacity: value,
                          child: child,
                        ),
                      );
                    },
                    child: _CoinListItem(coin: coin),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

/// A reusable, stateless widget for displaying a single coin.
/// This cleans up the main widget and removes code duplication.
class _CoinListItem extends StatelessWidget {
  const _CoinListItem({required this.coin});
  final Coin coin;

  @override
  Widget build(BuildContext context) {
    final bool isPositive = coin.priceChangePercentage >= 0;

    return ListTile(
      onTap: () {
        context.push('/home/coin-details', extra: coin);
      },
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: SvgPicture.asset(
        coin.imageUrl,
        width: 32,
        height: 32,
        placeholderBuilder: (context) => const CircleAvatar(
            radius: 16, backgroundColor: AppTheme.primaryDark),
      ),
      title: Text(coin.name,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
      subtitle: Text(coin.symbol,
          style: const TextStyle(color: AppTheme.textLight, fontSize: 12)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            // In a real app, use NumberFormat from the `intl` package for localization
            '\$${coin.price.toStringAsFixed(2)}',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),
          ),
          const SizedBox(height: 4),
          Text(
            '${isPositive ? '+' : ''}${coin.priceChangePercentage.toStringAsFixed(2)}%',
            style: TextStyle(
                color: isPositive ? AppTheme.accentGreen : Colors.redAccent,
                fontSize: 12),
          ),
        ],
      ),
    );
  }
}
