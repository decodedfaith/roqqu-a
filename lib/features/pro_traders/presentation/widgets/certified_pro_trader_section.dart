import 'package:flutter/material.dart';
import 'package:roqqu_mobile_t/features/pro_traders/domain/models/pro_trader.dart';

class CertifiedProTraderSection extends StatelessWidget {
  final ProTrader trader;

  const CertifiedProTraderSection({super.key, required this.trader});

  @override
  Widget build(BuildContext context) {
    final badges = <Widget>[
      if (trader.roi > 100)
        Container(
          width: 150,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: Colors.green.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'High win rate',
            style: TextStyle(
              color: Colors.green,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      if (trader.copiers > 5)
        Container(
          width: 150,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: Colors.orange.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            'Great risk control',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
    ];

    return badges.isNotEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (trader.isPro)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: const Color(0xFF20252B).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Certified Pro Trader',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: badges
                    .map((badge) => [badge, const SizedBox(width: 8)]
                        // ignore: unnecessary_null_comparison
                        .where((e) => e != null)
                        .toList())
                    .expand((e) => e)
                    .toList()
                  ..removeLast(),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
