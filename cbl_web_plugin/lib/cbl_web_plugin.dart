library cbl_web_plugin;

import 'dart:async';

import 'package:web_socket_channel/web_socket_channel.dart';

class CblWebsocket {
  late WebSocketChannel _channel;
  late StreamSubscription<dynamic> _streamSubscription;

  void start(String url) {
    final wsUrl = Uri.parse(url);
    _channel = WebSocketChannel.connect(wsUrl);
    print('WebSocket started');

    _streamSubscription = _channel.stream.listen((message) {
      print('Received message: $message');
    });
  }

  void stop() {
    _streamSubscription.cancel();
    _channel.sink.close();
    print('WebSocket stopped');
  }
}