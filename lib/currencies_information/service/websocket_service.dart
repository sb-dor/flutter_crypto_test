import 'package:web_socket_channel/web_socket_channel.dart';

final class WebsocketService {
  final WebSocketChannel _webSocketChannel;

  WebSocketChannel get channel => _webSocketChannel;

  WebsocketService({required WebSocketChannel channel}) : _webSocketChannel = channel;

  void message(String message) {
    _webSocketChannel.sink.add(message);
  }

  void dispose() {
    _webSocketChannel.sink.close();
  }
}
