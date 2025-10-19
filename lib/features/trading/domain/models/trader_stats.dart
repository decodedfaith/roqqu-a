class TraderStats {
  final int tradingDays;
  final double profitShare; // Percentage
  final int totalOrders;
  final double averageRoi;
  final double averageLosses;
  final List<String> tradingPairs; // e.g., ["BTCUSDT", "ETHUSDT"]

  TraderStats({
    required this.tradingDays,
    required this.profitShare,
    required this.totalOrders,
    required this.averageRoi,
    required this.averageLosses,
    required this.tradingPairs,
  });
}