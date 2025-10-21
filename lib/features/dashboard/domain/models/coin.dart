class Coin {
  final String id;
  final String name; // "Bitcoin"
  final String symbol; // "BTC"
  final String imageUrl;
  final double price;
  final double priceChangePercentage;

  Coin({
    required this.id,
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.priceChangePercentage,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      symbol:
          (json['s'] as String).replaceAll('USDT', ''), // 'BTCUSDT' -> 'BTC'
      price: double.parse(json['c'] as String), // Last price
      priceChangePercentage:
          double.parse(json['P'] as String), // Price change percent
      id: (json['s'] as String),
      name: _mapSymbolToName(json['s'] as String),
      imageUrl: _mapSymbolToImageUrl(json['s'] as String),
    );
  }

  // Helper methods to map symbols to full names/images
  static String _mapSymbolToName(String symbol) =>
      'Bitcoin'; //TODO:  Simplified for example
  static String _mapSymbolToImageUrl(String symbol) => 'aa';
}
