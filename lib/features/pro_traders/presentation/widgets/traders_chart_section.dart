import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:roqqu_mobile_t/core/theme/app_theme.dart';

class TraderChartSection extends StatelessWidget {
  final List<FlSpot> mockRoiSpots = const [
    FlSpot(0, 110),
    FlSpot(1, 115),
    FlSpot(2, 140),
    FlSpot(3, 130),
    FlSpot(4, 150),
    FlSpot(5, 170),
    FlSpot(6, 160),
  ];
  const TraderChartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const SizedBox(height: 14),
          // --- ROI Line Chart ---
          _buildChartCard(
            title: 'ROI',
            child: _buildFullLineChart(mockRoiSpots),
          ),
          const SizedBox(height: 20), // Space for the Copy Trade button

          // --- PNL Line Chart (example) ---
          _buildChartCard(
            title: 'PNL',
            child: _buildFullLineChart(mockRoiSpots),
          ),
          const SizedBox(height: 14),

          // --- Assets Allocation Pie Chart ---
          _buildChartCard(
            title: 'Assets allocation',
            child: _buildFullLineChart(mockRoiSpots),
          ),
          const SizedBox(height: 24),

          // --- Holding Period Scatter Plot ---
          _buildChartCard(
            title: 'Holding period',
            child: _buildHoldingPeriodChart(),
            legend: _buildScatterChartLegend(),
          ),
        ],
      ),
    );
  }

  Widget _buildChartCard({
    required String title,
    required Widget child,
    Widget? legend,
  }) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      decoration: BoxDecoration(
        color: AppTheme.cardDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTheme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppTheme.cardDark,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Text('7 days', style: TextStyle(color: Colors.white)),
                    SizedBox(width: 8),
                    Icon(Icons.keyboard_arrow_down,
                        color: Colors.white, size: 16),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 180,
            child: child,
          ),
          if (legend != null) ...[
            const SizedBox(height: 16),
            Center(child: legend),
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }

  /// The concrete implementation of the full-size line chart.
  Widget _buildFullLineChart(List<FlSpot> spots) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        lineTouchData: const LineTouchData(handleBuiltInTouches: false),
        titlesData: FlTitlesData(
          show: true,
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (value, meta) {
                const style =
                    TextStyle(color: AppTheme.textLight, fontSize: 12);
                switch (value.toInt()) {
                  case 0:
                    return const Text('03-23', style: style);
                  case 1:
                    return const Text('03-24', style: style);
                  case 2:
                    return const Text('03-25', style: style);
                  case 3:
                    return const Text('03-26', style: style);
                  case 4:
                    return const Text('03-27', style: style);
                  case 5:
                    return const Text('03-28', style: style);
                  default:
                    return const Text('');
                }
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                if (value % 10 == 0 && value != meta.min && value != meta.max) {
                  return Text(
                    '${value.toInt()}%',
                    style: const TextStyle(
                        color: AppTheme.textLight, fontSize: 12),
                    textAlign: TextAlign.left,
                  );
                }
                return const Text('');
              },
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: AppTheme.accentGreen,
            barWidth: 1.3,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  // ignore: deprecated_member_use
                  AppTheme.accentGreen.withOpacity(0.3),
                  Colors.transparent
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHoldingPeriodChart() {
    final List<ScatterSpot> profitSpots = [
      ScatterSpot(0.5, 64),
      ScatterSpot(0.8, 65),
      ScatterSpot(1.2, 68),
      ScatterSpot(1.5, 66),
      ScatterSpot(2.1, 69),
      ScatterSpot(2.5, 70),
    ];
    final List<ScatterSpot> lossSpots = [
      ScatterSpot(1.8, 62),
      ScatterSpot(3.0, 64),
    ];

    return ScatterChart(
      ScatterChartData(
        scatterSpots: [
          ...profitSpots.map((s) => ScatterSpot(
                s.x,
                s.y,
              )),
          ...lossSpots.map((s) => ScatterSpot(
                s.x,
                s.y,
              )),
        ],
        minX: 0,
        maxX: 4,
        minY: 50,
        maxY: 80,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(color: Colors.white24, width: 1.5),
          ),
        ),
        scatterTouchData: ScatterTouchData(
          enabled: false,
        ),
        titlesData: FlTitlesData(
          show: true,
          rightTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles:
              const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                if (value == 64) {
                  return const Text('64k',
                      style:
                          TextStyle(color: AppTheme.textLight, fontSize: 12));
                }
                return const Text('');
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              interval: 1,
              getTitlesWidget: (value, meta) {
                const style =
                    TextStyle(color: AppTheme.textLight, fontSize: 12);
                switch (value.toInt()) {
                  case 0:
                    return const Text('1m', style: style);
                  case 1:
                    return const Text('24h', style: style);
                  case 2:
                    return const Text('5d', style: style);
                  case 3:
                    return const Text('15d', style: style);
                  default:
                    return const Text('');
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScatterChartLegend() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildLegendItem(AppTheme.accentGreen, 'Profit'),
        const SizedBox(width: 24),
        _buildLegendItem(Colors.redAccent, 'Loss'),
      ],
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(color: AppTheme.textLight, fontSize: 12),
        ),
      ],
    );
  }
}
