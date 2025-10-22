import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:roqqu_mobile_t/core/theme/app_theme.dart';

/// A compact, styled line chart for displaying a trader's performance.
class MiniPerformanceChart extends StatelessWidget {
  final List<FlSpot> spots;
  final Color lineColor;
  final List<Color> gradientColors;

  const MiniPerformanceChart({
    super.key,
    required this.spots,
    this.lineColor = AppTheme.accentGreen,
  }) : gradientColors = const [
          AppTheme.accentGreen,
          Colors.transparent,
        ];

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: lineColor,
            barWidth: 0.8,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: gradientColors
                    // ignore: deprecated_member_use
                    .map((color) => color.withOpacity(0.15))
                    .toList(),
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],

        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(show: false),

        minX: 0,
        maxX: spots.length.toDouble() - 1, // Assumes X values are indices
        minY: _getMinY(spots),
        maxY: _getMaxY(spots),

        lineTouchData: const LineTouchData(
          handleBuiltInTouches: false,
        ),
      ),
      duration: const Duration(milliseconds: 250),
    );
  }

  // Helper functions to dynamically set the Y-axis range
  double _getMinY(List<FlSpot> spots) {
    if (spots.isEmpty) return 0;
    return spots.map((spot) => spot.y).reduce((a, b) => a < b ? a : b) * 0.95;
  }

  double _getMaxY(List<FlSpot> spots) {
    if (spots.isEmpty) return 1;
    return spots.map((spot) => spot.y).reduce((a, b) => a > b ? a : b) * 1.05;
  }
}
