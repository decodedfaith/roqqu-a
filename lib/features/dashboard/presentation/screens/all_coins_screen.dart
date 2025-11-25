import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_mobile_t/core/theme/app_theme.dart';
import 'package:roqqu_mobile_t/features/dashboard/domain/models/coin.dart';
import 'package:roqqu_mobile_t/features/dashboard/presentation/providers/coin_providers.dart';

class AllCoinsScreen extends ConsumerWidget {
  const AllCoinsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coinListAsync = ref.watch(coinListProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF1C2127),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C2127),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'All Coins',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: coinListAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Text('Error: $err', style: const TextStyle(color: Colors.red)),
        ),
        data: (coins) {
          if (coins.isEmpty) {
            return const Center(
              child: Text('No coins available',
                  style: TextStyle(color: AppTheme.textLight)),
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              // Invalidate the provider to trigger a reconnection/refresh
              ref.invalidate(coinListProvider);
              // Wait a bit to show the loading indicator (optional, as the stream might emit immediately)
              await Future.delayed(const Duration(seconds: 1));
            },
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: coins.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.withValues(alpha: 0.1),
                height: 1,
              ),
              itemBuilder: (context, index) {
                final coin = coins[index];
                return TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: Duration(milliseconds: 300 + (index * 50)),
                  curve: Curves.easeOut,
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(0, 20 * (1 - value)),
                      child: Opacity(
                        opacity: value,
                        child: child,
                      ),
                    );
                  },
                  child: _CoinListItem(coin: coin),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

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
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
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
