import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crypto_test/akshit_madan/bloc/akshit_madan_bloc.dart';
import 'package:flutter_crypto_test/currencies_information/models/currency_model.dart';
import 'package:flutter_crypto_test/currencies_information/service/websocket_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'currencies_info_bloc.freezed.dart';

@freezed
class CurrenciesInfoEvent with _$CurrenciesInfoEvent {
  const factory CurrenciesInfoEvent.init() = _InitCurrenciesInfoOnCurrenciesInfoEvent;

  const factory CurrenciesInfoEvent.currencyHandler(List<CurrencyModel> currencies) =
      _CurrentHandlerOnCurrencyInfoEvent;
}

@freezed
sealed class CurrenciesInfoState with _$CurrenciesInfoState {
  const factory CurrenciesInfoState.inProgress() = InProgressStateOnCurrenciesInfoState;

  const factory CurrenciesInfoState.completed(List<CurrencyModel> currencies) =
      CompletedStateOnCurrenciesInfoState;
}

class CurrenciesInfoBloc extends Bloc<CurrenciesInfoEvent, CurrenciesInfoState> {
  StreamSubscription<List<CurrencyModel>>? _listCurrencySubs;

  final WebsocketService _websocketService;

  CurrenciesInfoBloc(this._websocketService)
      : super(
          const CurrenciesInfoState.inProgress(),
        ) {
    on<CurrenciesInfoEvent>(
      (event, emit) => event.map(
        init: (event) => _initialization(event, emit),
        currencyHandler: (event) => _currencySolver(event, emit),
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

    final transformedStream = CurrencyModelStreamTransformer()
        .bind(_websocketService.channel.stream)
        .bufferTime(Duration(seconds: 3));

    _listCurrencySubs = transformedStream.listen(
      (currencies) {
        add(CurrenciesInfoEvent.currencyHandler(currencies));
      },
    );
  }

  void _currencySolver(
    _CurrentHandlerOnCurrencyInfoEvent event,
    Emitter<CurrenciesInfoState> emit,
  ) {
    final currencies = _currencyGroupSolver(event.currencies);

    if (state is InProgressStateOnCurrenciesInfoState) {
      emit(CurrenciesInfoState.completed(currencies));
      return;
    }

    final currentState = state as CompletedStateOnCurrenciesInfoState;

    if (currentState.currencies.isEmpty) {
      emit(CurrenciesInfoState.completed(currencies));
      return;
    }

    List<CurrencyModel> currenciesCopies = List.from(currentState.currencies);

    final Map<String?, (CurrencyModel model, int indexInList)> currenciesModelMap = {};

    for (int index = 0; index < currenciesCopies.length; index++) {
      final each = currenciesCopies[index];
      currenciesModelMap[each.instrument?.trim()] = (each, index);
    }

    for (final each in currencies) {
      final findCurrencyModel = currenciesModelMap[each.instrument?.trim()];
      if (findCurrencyModel != null) {
        currenciesCopies[findCurrencyModel.$2] = each;
      } else {
        currenciesCopies.add(each);
      }
    }

    emit(CurrenciesInfoState.completed(currenciesCopies));
  }

  List<CurrencyModel> _currencyGroupSolver(List<CurrencyModel> currencies) {
    final Map<String?, CurrencyModel> map = {};
    for (final each in currencies) {
      final find = map[each.instrument?.trim()];
      if (find != null) {
        final inLoopDatetime =
            DateTime.fromMillisecondsSinceEpoch((each.lastUpdateTimestamp ?? 0) * 1000);
        final inMapDatetime =
            DateTime.fromMillisecondsSinceEpoch((find.lastUpdateTimestamp ?? 0) * 1000);
        if (inLoopDatetime.isAfter(inMapDatetime)) {
          map[each.instrument?.trim()] = each;
        }
      } else {
        map[each.instrument?.trim()] = each;
      }
    }

    return map.entries.map((element) => element.value).toList();
  }

  @override
  Future<void> close() {
    _websocketService.dispose();
    _listCurrencySubs?.cancel();
    return super.close();
  }
}

class CurrencyModelStreamTransformer extends StreamTransformerBase<dynamic, CurrencyModel> {
  @override
  Stream<CurrencyModel> bind(Stream stream) async* {
    yield* stream.transform(
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
  }
}
