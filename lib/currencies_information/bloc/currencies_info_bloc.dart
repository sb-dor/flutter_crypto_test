import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crypto_test/akshit_madan/bloc/akshit_madan_bloc.dart';
import 'package:flutter_crypto_test/currencies_information/models/currency_model.dart';
import 'package:flutter_crypto_test/currencies_information/service/websocket_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currencies_info_bloc.freezed.dart';

@freezed
class CurrenciesInfoEvent with _$CurrenciesInfoEvent {
  const factory CurrenciesInfoEvent.init() = _InitCurrenciesInfoOnCurrenciesInfoEvent;
}

@freezed
sealed class CurrenciesInfoState with _$CurrenciesInfoState {
  const factory CurrenciesInfoState.inProgress() = InProgressStateOnCurrenciesInfoState;

  const factory CurrenciesInfoState.completed(List<CurrencyModel> currencies) =
      CompletedStateOnCurrenciesInfoState;
}

class CurrenciesInfoBloc extends Bloc<CurrenciesInfoEvent, CurrenciesInfoState> {
  final WebsocketService _websocketService;

  CurrenciesInfoBloc(this._websocketService)
      : super(
          const CurrenciesInfoState.inProgress(),
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
      "instruments": ["BTC-USD", "ETH-USD", "XRP-USD", "LTC-USD", "ADA-USD"],
    };

    _websocketService.message(jsonEncode(subscriptionRequest));

    emit(CurrenciesInfoState.completed(<CurrencyModel>[]));

    await for (final each in _websocketService.channel.stream.distinct()) {
      debugPrint("each data $each");
      _currencySolver(emit, jsonDecode(each));
    }
  }

  void _currencySolver(Emitter<CurrenciesInfoState> emit, Map<String, dynamic> json) {
    if (json.containsKey('INSTRUMENT') || json.containsKey('instrument')) {
      List<CurrencyModel> currencies =
          List.from((state as CompletedStateOnCurrenciesInfoState).currencies);

      final currencyJson = CurrencyModel.fromJson(json);

      final currencyModelIndex = currencies.indexWhere(
        (currency) =>
            currency.instrument?.trim() == currencyJson.instrument?.trim() &&
            currency.market?.trim() == currencyJson.market?.trim(),
      );

      if (currencyModelIndex != -1) {
        currencies[currencyModelIndex] = currencyJson;
      } else {
        currencies.add(currencyJson);
      }
      emit(CurrenciesInfoState.completed(currencies));
    }
  }

  @override
  Future<void> close() {
    _websocketService.dispose();
    return super.close();
  }
}
