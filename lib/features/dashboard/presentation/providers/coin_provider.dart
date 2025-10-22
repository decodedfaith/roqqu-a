// import 'dart:async';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:roqqu_mobile_t/core/services/websocket_service.dart';
// import 'package:roqqu_mobile_t/features/dashboard/data/datasources/binance_data_source.dart';
// import 'package:roqqu_mobile_t/features/dashboard/domain/models/coin.dart';

// part 'coin_providers.g.dart'; // Run build_runner to generate this

// @riverpod
// WebSocketService webSocketService(WebSocketServiceRef ref) {
//   return WebSocketService();
// }

// @riverpod
// BinanceDataSource binanceDataSource(BinanceDataSourceRef ref) {
//   return BinanceDataSource(ref.watch(webSocketServiceProvider));
// }

// // This notifier will manage the list of coins for the UI
// @riverpod
// class CoinList extends _$CoinList {
//   StreamSubscription? _subscription;

//   @override
//   List<Coin> build() {
//     // Start listening when the provider is first read
//     _listenToCoinStream();
//     // Return an empty list as the initial state
//     return [];
//   }

//   void _listenToCoinStream() {
//     // Get the stream from the data source
//     final stream = ref.read(binanceDataSourceProvider).getTickerStream();

//     // Cancel any existing subscription
//     _subscription?.cancel();

//     // Listen to the new stream
//     _subscription = stream.listen((coin) {
//       // Create a copy of the current state
//       final currentList = List<Coin>.from(state);
//       // Find if the coin already exists in the list
//       final index = currentList.indexWhere((c) => c.id == coin.id);

//       if (index != -1) {
//         // If it exists, update it
//         currentList[index] = coin;
//       } else {
//         // If it's a new coin, add it
//         currentList.add(coin);
//       }

//       // Update the state with the new list, which will notify the UI
//       state = currentList;
//     });

//     // Clean up the subscription when the provider is disposed
//     ref.onDispose(() => _subscription?.cancel());
//   }
// }
