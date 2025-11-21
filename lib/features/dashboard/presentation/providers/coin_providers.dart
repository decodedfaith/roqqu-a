// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:roqqu_mobile_t/features/dashboard/domain/models/coin.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'coin_providers.g.dart'; // Ensure this line is present and correct

/// The main provider for the UI's coin list.
/// It manages the WebSocket connection and provides a stream of updated coin data.
@riverpod
Stream<List<Coin>> coinList(ref) {
  // Use a broadcast controller so the stream can be listened to multiple times if needed,
  // though Riverpod's caching makes this less critical.
  final controller = StreamController<List<Coin>>.broadcast();

  // A map to hold the latest state of each coin for efficient updates.
  final coinMap = <String, Coin>{};

  WebSocketChannel? channel;
  StreamSubscription? channelSubscription;

  // --- The main logic for connecting and listening ---
  Future<void> connect() async {
    try {
      channel = WebSocketChannel.connect(
        Uri.parse('wss://stream.binance.com:9443/ws'),
      );

      // Wait for the connection to be ready before subscribing
      await channel!.ready;

      // The list of coins to watch
      final symbolsToWatch = [
        "btcusdt@miniTicker",
        "ethusdt@miniTicker",
        "bnbusdt@miniTicker",
        "solusdt@miniTicker",
        "xrpusdt@miniTicker",
        "dogeusdt@miniTicker",
        "adausdt@miniTicker",
        "maticusdt@miniTicker",
      ];
      final subscriptionMessage = {
        "method": "SUBSCRIBE",
        "params": symbolsToWatch,
        "id": 1
      };

      channel!.sink.add(jsonEncode(subscriptionMessage));

      // Listen to the stream for incoming messages
      channelSubscription = channel!.stream.listen(
        (message) {
          try {
            final data = jsonDecode(message);

            if (data is Map<String, dynamic> && data['e'] == '24hrMiniTicker') {
              final coin = Coin.fromJson(data);
              coinMap[coin.id] = coin;
            } else if (data is List) {
              for (final item in data) {
                if (item is Map<String, dynamic> &&
                    item['e'] == '24hrMiniTicker') {
                  final coin = Coin.fromJson(item);
                  coinMap[coin.id] = coin;
                }
              }
            }

            // Only emit an update if the map has data.
            if (coinMap.isNotEmpty) {
              final list = coinMap.values.toList()
                ..sort((a, b) => a.id.compareTo(b.id));
              controller.add(list);
            }
          } catch (e) {
            // Handle error silently or log to a proper logger
          }
        },
        onError: (error) {
          // Attempt to reconnect on error
          _reconnect(ref);
        },
        onDone: () {
          // Attempt to reconnect when connection closes
          _reconnect(ref);
        },
        cancelOnError: true,
      );
    } catch (e) {
      // Attempt to reconnect on connection failure
      _reconnect(ref);
    }
  }

  // --- Start the connection process ---
  connect();

  // This is the most important part. It ensures everything is cleaned up
  // when the provider is no longer being listened to.
  ref.onDispose(() {
    channelSubscription?.cancel();
    channel?.sink.close();
    controller.close();
  });

  // Return the stream from our controller for the UI to listen to.
  return controller.stream;
}

void _reconnect(dynamic ref) {
  // Simple exponential backoff or fixed delay could be used here.
  // For now, we'll just wait 5 seconds and try to invalidate the provider
  // to trigger a rebuild/reconnect.
  Future.delayed(const Duration(seconds: 5), () {
    // Invalidate the provider to force a re-execution of the provider body,
    // which will call connect() again.
    ref.invalidate(coinListProvider);
  });
}
