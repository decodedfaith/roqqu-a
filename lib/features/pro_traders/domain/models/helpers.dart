/// A generic data point for all time-series charts.
class ChartDataPoint {
  final DateTime time;
  final double value;

  const ChartDataPoint({required this.time, required this.value});
}

typedef AssetAllocation = Map<String, double>;

class TraderStats {
  final int tradingDays;
  final double profitShare;
  final int totalOrders;
  final double assetsUnderManagement;

  const TraderStats({
    required this.tradingDays,
    required this.profitShare,
    required this.totalOrders,
    required this.assetsUnderManagement,
  });
}
