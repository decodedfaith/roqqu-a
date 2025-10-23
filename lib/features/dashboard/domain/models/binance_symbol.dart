class BinanceSymbol {
  final String symbol;
  final String status;
  final String baseAsset;
  final String quoteAsset;

  const BinanceSymbol({
    required this.symbol,
    required this.status,
    required this.baseAsset,
    required this.quoteAsset,
  });

  factory BinanceSymbol.fromJson(Map<String, dynamic> json) {
    return BinanceSymbol(
      symbol: json['symbol'],
      status: json['status'],
      baseAsset: json['baseAsset'],
      quoteAsset: json['quoteAsset'],
    );
  }
}
