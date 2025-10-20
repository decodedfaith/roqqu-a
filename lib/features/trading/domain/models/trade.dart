class Trade {
  final String id;
  final String tradingPair;
  final double leverage;
  final double entryPrice;
  final double? exitPrice;
  final DateTime entryTime;
  final DateTime? exitTime;
  final double roi;
  final String proTraderName;
  final String proTraderAvatarUrl;

  Trade({
    required this.id,
    required this.tradingPair,
    required this.leverage,
    required this.entryPrice,
    this.exitPrice,
    required this.entryTime,
    this.exitTime,
    required this.roi,
    required this.proTraderName,
    required this.proTraderAvatarUrl,
  });
}
