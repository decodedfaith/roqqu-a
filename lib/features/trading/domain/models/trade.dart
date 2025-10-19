
///`Trade`
///Represents a single trading operation. This model is versatile and can be used for a pro trader's history, the user's current trades, and the user's trade history.


class Trade {
  final String id;
  final String tradingPair; // e.g., "BTCUSDT"
  final double leverage; // e.g., 10x
  final double entryPrice;
  final double? exitPrice; // Nullable for open trades
  final DateTime entryTime;
  final DateTime? exitTime; // Nullable for open trades
  final double roi;
  final String proTraderName; // To identify who made the trade
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