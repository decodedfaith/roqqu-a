import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  WebSocketChannel? _channel;
  Stream? _broadcastStream;

  void connect(String url) {
    if (_channel != null) return; // Already connected
    _channel = WebSocketChannel.connect(Uri.parse(url));
    _broadcastStream = _channel!.stream.asBroadcastStream();
  }

  // Exposes the raw stream of data from the socket
  Stream<dynamic> get stream {
    if (_broadcastStream == null) {
      throw Exception('WebSocket is not connected. Call connect() first.');
    }
    return _broadcastStream!;
  }

  // Sends a subscription message to the server
  void subscribe(List<String> symbols) {
    if (_channel == null) return;

    final message = {"method": "SUBSCRIBE", "params": symbols, "id": 1};
    _channel!.sink.add(jsonEncode(message));
  }

  void disconnect() {
    if (_channel != null) {
      _channel!.sink.close();
      _channel = null;
    }
  }
}
