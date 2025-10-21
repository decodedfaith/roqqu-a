import 'dart:ui';
import 'package:roqqu_mobile_t/features/trading/domain/models/asset_allocation.dart';
import 'package:roqqu_mobile_t/features/trading/domain/models/chart_data_point.dart';
import 'package:roqqu_mobile_t/features/trading/domain/models/trader_stats.dart';

class ProTrader {
  final String id;
  final String name;
  final String initials;
  final String? avatarUrl;
  final bool isPro;
  final int copiers;
  final double roi;
  final String? totalPnl;
  final double winRate;
  final TraderStats? stats;
  final AssetAllocation assetAllocation;
  final List<ChartDataPoint> roiHistory;
  final List<ChartDataPoint> pnlHistory;

  const ProTrader({
    required this.id,
    required this.name,
    required this.initials,
    this.avatarUrl,
    this.isPro = false,
    required this.copiers,
    required this.roi,
    this.totalPnl,
    required this.winRate,
    this.stats,
    required this.assetAllocation,
    required this.roiHistory,
    required this.pnlHistory,
    required assetsUnderManagement,
    required int aum,
    required Color avatarColor,
    required Color ringColor,
  });
}
