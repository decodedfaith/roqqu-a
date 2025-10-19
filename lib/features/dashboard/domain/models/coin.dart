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
}