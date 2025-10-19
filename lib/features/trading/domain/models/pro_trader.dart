import 'package:roqqu_mobile_t/features/trading/domain/models/asset_allocation.dart';
import 'package:roqqu_mobile_t/features/trading/domain/models/chart_data_point.dart';
import 'package:roqqu_mobile_t/features/trading/domain/models/trader_stats.dart';

class ProTrader {
  final String id;
  final String name;
  final String avatarUrl; // Or initials if no URL
  final int copiers;
  final double roi; // Return on Investment (percentage)
  final double totalPnl; // Total Profit and Loss
  final double winRate; // Percentage
  final double assetsUnderManagement; // AuM
  final TraderStats stats;
  final AssetAllocation assetAllocation;
  final List<ChartDataPoint> roiHistory; // For the ROI chart
  final List<ChartDataPoint> pnlHistory; // For the PNL chart

  ProTrader({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.copiers,
    required this.roi,
    required this.totalPnl,
    required this.winRate,
    required this.assetsUnderManagement,
    required this.stats,
    required this.assetAllocation,
    required this.roiHistory,
    required this.pnlHistory,
  });
}
