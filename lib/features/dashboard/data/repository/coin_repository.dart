// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:roqqu_mobile_t/features/dashboard/domain/models/binance_symbol.dart';
// import 'package:roqqu_mobile_t/features/dashboard/domain/models/coin.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';

// class CoinRepository {
//   /// Fetches metadata for all trading symbols from the Binance REST API.
//   Future<List<BinanceSymbol>> fetchAllTradableSymbols() async {
//     print(
//         "--- [Repository] Fetching all exchange symbols from Binance REST API... ---");
//     final url = Uri.parse('https://api.binance.com/api/v3/exchangeInfo');

//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body);
//         final List<dynamic> symbolsData = data['symbols'];

//         final symbols = symbolsData
//             .map((json) => BinanceSymbol.fromJson(json))
//             .where((s) => s.status == 'TRADING' && s.quoteAsset == 'USDT')
//             .toList();

//         print(
//             "--- [Repository] Found ${symbols.length} active USDT trading pairs. ---");
//         return symbols;
//       } else {
//         throw Exception(
//             'Failed to load exchange info: Status Code ${response.statusCode}');
//       }
//     } catch (e) {
//       print("--- [Repository] Error fetching exchange info: $e ---");
//       rethrow;
//     }
//   }

//   /// Connects to the WebSocket and returns a stream of Coin lists.
//   Stream<List<Coin>> getCoinStream(List<BinanceSymbol> symbolsToWatch) {
//     print("--- [Repository] Initializing WebSocket stream... ---");
//     final channel = WebSocketChannel.connect(
//       Uri.parse('wss://stream.binance.com:9443/ws'),
//     );

//     // Dynamically create the list of symbols to subscribe to.
//     final subscriptionParams = symbolsToWatch
//         .map((s) => '${s.symbol.toLowerCase()}@miniTicker')
//         .toList();

//     final subscriptionMessage = {
//       "method": "SUBSCRIBE",
//       "params": subscriptionParams,
//       "id": 1
//     };

//     print(
//         "--- [Repository] Subscribing to ${subscriptionParams.length} WebSocket streams... ---");
//     channel.sink.add(jsonEncode(subscriptionMessage));

//     final coinMap = <String, Coin>{};

//     return channel.stream.map((message) {
//       try {
//         final data = jsonDecode(message);

//         if (data is Map<String, dynamic> && data['e'] == '24hrMiniTicker') {
//           final coin = Coin.fromBinanceJson(data);
//           coinMap[coin.id] = coin;
//         } else if (data is List) {
//           for (final item in data) {
//             if (item is Map<String, dynamic> && item['e'] == '24hrMiniTicker') {
//               final coin = Coin.fromBinanceJson(item);
//               coinMap[coin.id] = coin;
//             }
//           }
//         }

//         return coinMap.values.toList()
//           ..sort((a, b) => a.symbol.compareTo(b.symbol));
//       } catch (e) {
//         print("--- [Repository] Error parsing WebSocket message: $e ---");
//         return coinMap.values.toList();
//       }
//     });
//   }
// }
