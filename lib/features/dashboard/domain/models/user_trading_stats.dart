class UserTradingStats {
  final int copiedProTradersCount;
  final int tradingDays;
  final int totalOrders;
  final double averageLosses;
  final int totalCopyTrades;
  final List<String> tradingPairs;

  UserTradingStats({
    required this.copiedProTradersCount,
    required this.tradingDays,
    required this.totalOrders,
    required this.averageLosses,
    required this.totalCopyTrades,
    required this.tradingPairs,
  });
}