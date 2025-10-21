import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:roqqu_mobile_t/common/widgets/mini_performance_chart.dart';
import 'package:roqqu_mobile_t/common/widgets/trader_avater.dart';
import 'package:roqqu_mobile_t/core/theme/app_theme.dart';
import 'package:roqqu_mobile_t/features/pro_traders/domain/models/pro_trader.dart';

class ProTraderListItem extends StatelessWidget {
  final ProTrader trader;
  const ProTraderListItem({super.key, required this.trader});

  final List<FlSpot> mockChartSpots = const [
    FlSpot(0, 1),
    FlSpot(1, 1.5),
    FlSpot(2, 1.4),
    FlSpot(3, 3.4),
    FlSpot(4, 2),
    FlSpot(5, 2.2),
    FlSpot(6, 1.8),
    FlSpot(7, 3),
    FlSpot(8, 2.5),
    FlSpot(9, 2.8),
    FlSpot(10, 2.6),
    FlSpot(11, 2.9),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/home/pro-traders/details/123');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.cardDark,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        TraderAvatar(
                          initials: trader.initials,
                          backgroundColor: Colors.cyan,
                          ringColor: Colors.yellow,
                          isProTrader: trader.isPro,
                          radius: 22,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(trader.name,
                                style: AppTheme.textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontSize: 14,
                                )),
                            Row(
                              children: [
                                SvgPicture.asset('assets/icons/users-alt.svg'),
                                const SizedBox(width: 6),
                                Text(
                                  '$trader',
                                  style:
                                      AppTheme.textTheme.bodyMedium?.copyWith(
                                    color: const Color(0xFF85D1F0),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildStatColumn('ROI', '+${trader.roi}%',
                            AppTheme.accentGreen, false),
                        _buildStatColumn('Total PNL: ', '${trader.totalPnl}',
                            Colors.white, true),
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        backgroundColor: const Color(0xFF1C2127),
                        foregroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Copy',
                        style:
                            TextStyle(color: Color(0xFFA7B1BC), fontSize: 13),
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 100,
                      height: 40,
                      child: MiniPerformanceChart(
                        spots: mockChartSpots,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0XFF1C2127),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("Win rate:", style: AppTheme.textTheme.bodyMedium),
                    const SizedBox(width: 4),
                    Text(
                      '${trader.winRate}%',
                      style: AppTheme.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('assets/icons/vector.svg'),
                    const SizedBox(width: 4),
                    Text('AUM: ${trader.totalPnl}',
                        style: AppTheme.textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 15)
        ],
      ),
    );
  }

  Widget _buildStatColumn(
      String title, String value, Color valueColor, bool isRow) {
    if (isRow) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTheme.textTheme.bodyMedium?.copyWith(fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTheme.textTheme.titleMedium?.copyWith(
                color: valueColor, fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTheme.textTheme.bodyMedium),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTheme.textTheme.titleMedium?.copyWith(
              color: valueColor,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      );
    }
  }
}
