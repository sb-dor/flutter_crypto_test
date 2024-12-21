import 'dart:async';
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

    final transformedStream = _websocketService.channel.stream.transform<CurrencyModel>(
      StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          debugPrint("each data in handler $data");
          final Map<String, dynamic> json = jsonDecode(data);
          if (json.containsKey('INSTRUMENT') || json.containsKey('instrument')) {
            sink.add(CurrencyModel.fromJson(json));
          }
        },
        handleError: (error, stackTrace, sink) {
          // errors will be handled here
          // 1. send error to your selver
          // 2. you can transform error or add something else in sink if error occurs
          /// sink.add(modelThatYouWantToAdd);
          // if you use this error handler
          // stream will be stopped
          /// Error.throwWithStackTrace(error, stackTrace);
        },
      ),
    );

    await for (final each in transformedStream) {
      _currencySolver(emit, each);
    }
  }

  void _currencySolver(Emitter<CurrenciesInfoState> emit, CurrencyModel currencyModel) {
    List<CurrencyModel> currencies = List.from(
      (state as CompletedStateOnCurrenciesInfoState).currencies,
    );

    final currencyModelIndex = currencies.indexWhere(
      (currency) =>
          currency.instrument?.trim() == currencyModel.instrument?.trim() &&
          currency.market?.trim() == currencyModel.market?.trim(),
    );

    if (currencyModelIndex != -1) {
      currencies[currencyModelIndex] = currencyModel;
    } else {
      currencies.add(currencyModel);
    }
    emit(CurrenciesInfoState.completed(currencies));
  }

  @override
  Future<void> close() {
    _websocketService.dispose();
    return super.close();
  }
}
