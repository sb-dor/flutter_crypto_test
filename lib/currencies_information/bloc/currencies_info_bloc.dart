import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crypto_test/currencies_information/service/websocket_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currencies_info_bloc.freezed.dart';

@freezed
class CurrenciesInfoEvent with _$CurrenciesInfoEvent {
  const factory CurrenciesInfoEvent.init() = _InitCurrenciesInfoOnCurrenciesInfoEvent;
}

@freezed
class CurrenciesInfoState with _$CurrenciesInfoState {
  const factory CurrenciesInfoState.initial(String data) = _InitialStateOnCurrenciesInfoState;
}

class CurrenciesInfoBloc extends Bloc<CurrenciesInfoEvent, CurrenciesInfoState> {
  final WebsocketService _websocketService;

  CurrenciesInfoBloc(this._websocketService)
      : super(
          const CurrenciesInfoState.initial(''),
        ) {
    on<CurrenciesInfoEvent>(
      (event, emit) => event.map(
        init: (event) => _initialization(event, emit),
      ),
    );
  }

  void _initialization(
    _InitCurrenciesInfoOnCurrenciesInfoEvent event,
    Emitter<CurrenciesInfoState> emit,
  ) async {
    final subscriptionRequest = {
      "action": "SUBSCRIBE",
      "type": "index_cc_v1_latest_tick",
      "groups": ["VALUE", "CURRENT_HOUR"],
      "market": "cadli",
      "instruments": ["BTC-USD"],
    };

    _websocketService.message(jsonEncode(subscriptionRequest));

    await for (final each in _websocketService.channel.stream) {
      debugPrint("each coming data: $each");
      emit(CurrenciesInfoState.initial(each.toString()));
    }
  }

  @override
  Future<void> close() {
    _websocketService.dispose();
    return super.close();
  }
}
