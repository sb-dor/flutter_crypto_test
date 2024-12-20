import 'package:flutter_crypto_test/currencies_information/api_key/crypto_compare_key.dart';
import 'package:flutter_crypto_test/currencies_information/bloc/currencies_info_bloc.dart';
import 'package:flutter_crypto_test/currencies_information/service/websocket_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract interface class Factory<T> {
  T create();
}

class CurrenciesFactory implements Factory<CurrenciesInfoBloc> {
  @override
  CurrenciesInfoBloc create() {
    final uri = Uri.parse("wss://data-streamer.cryptocompare.com/?api_key=$cckKey");

    final chanel = WebSocketChannel.connect(uri);

    final service = WebsocketService(channel: chanel);

    return CurrenciesInfoBloc(service);
  }
}
