import 'package:roqqu_mobile_t/core/utils/app_assets.dart';

class Coin {
  final String id;
  final String name;
  final String symbol;
  final String imageUrl;
  final double price;
  final double priceChangePercentage;
  final double highPrice;
  final double lowPrice;
  final double volume;

  const Coin({
    required this.id,
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.price,
    required this.priceChangePercentage,
    required this.highPrice,
    required this.lowPrice,
    required this.volume,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    final String fullSymbol = json['s'] as String;
    final double currentPrice = double.parse(json['c'] as String);
    final double openPrice = double.parse(json['o'] as String);
    double priceChangePercentage = 0.0;
    if (openPrice != 0) {
      priceChangePercentage = ((currentPrice - openPrice) / openPrice) * 100;
    }
    return Coin(
      id: fullSymbol,
      symbol: fullSymbol.replaceAll('USDT', ''),
      price: currentPrice,
      priceChangePercentage: priceChangePercentage,
      highPrice: double.parse(json['h'] as String),
      lowPrice: double.parse(json['l'] as String),
      volume: double.parse(json['v'] as String),
      name: _mapSymbolToName(fullSymbol),
      imageUrl:
          _mapSymbolToImageUrl(fullSymbol), // This will now work correctly
    );
  }

  // Helper for names remains the same
  static String _mapSymbolToName(String symbol) {
    switch (symbol) {
      case 'BTCUSDT':
        return 'Bitcoin';
      case 'ETHUSDT':
        return 'Ethereum';
      case 'BNBUSDT':
        return 'BNB';
      case 'SOLUSDT':
        return 'Solana';
      case 'XRPUSDT':
        return 'XRP';
      case 'DOGEUSDT':
        return 'Dogecoin';
      default:
        return symbol.replaceAll('USDT', '');
    }
  }

  // --- THIS IS THE FINAL, CORRECTED HELPER METHOD ---
  static String _mapSymbolToImageUrl(String symbol) {
    // We map the symbol from the API (e.g., 'BTCUSDT') to the exact
    // filename you have in your 'assets/icons/' folder.
    switch (symbol) {
      case 'BTCUSDT':
        return AppAssets.bitcoinIcon;
      case 'ETHUSDT':
        return AppAssets.ethereumIcon;
      case 'BNBUSDT':
        return AppAssets.bnbIcon;
      case 'SOLUSDT':
        return AppAssets.solIcon;
      case 'XRPUSDT':
        return AppAssets.xrpIcon;
      case 'DOGEUSDT':
        return AppAssets.dogeIcon;

      default:
        return AppAssets.orbIce;
    }
  }
}
