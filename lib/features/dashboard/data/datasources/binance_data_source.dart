import 'dart:async';
import 'dart:convert';
import 'package:roqqu_mobile_t/core/services/websocket_service.dart';
import 'package:roqqu_mobile_t/features/dashboard/domain/models/coin.dart';

class BinanceDataSource {
  final WebSocketService _webSocketService;

  BinanceDataSource(this._webSocketService);

  Stream<Coin> getTickerStream() {
    final controller = StreamController<Coin>();
    final symbolsToWatch = [
      "btcusdt@miniTicker",
      "ethusdt@miniTicker",
      "bnbusdt@miniTicker",
    ];

    try {
      _webSocketService.connect('wss://stream.binance.com:9443/ws');
      _webSocketService.subscribe(symbolsToWatch);

      _webSocketService.stream.listen(
        (message) {
          final data = jsonDecode(message);
          if (data is Map<String, dynamic> && data['e'] == '24hrMiniTicker') {
            final coin = Coin.fromJson(data);
            controller.add(coin);
          }
        },
        onError: (error) => controller.addError(error),
        onDone: () => controller.close(),
      );
    } catch (e) {
      controller.addError(e);
    }

    return controller.stream;
  }
}
