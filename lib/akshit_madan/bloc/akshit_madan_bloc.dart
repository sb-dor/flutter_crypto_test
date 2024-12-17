import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crypto_test/akshit_madan/models/transaction_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

part 'akshit_madan_bloc.freezed.dart';

const String rpcUrl = "http://192.168.100.3:7545";
const String socketUrl = "ws://192.168.100.3:7545";

const String address = "0x9571C52DB106a76F6aEfdb098cF3F2D0f8B6EE08";
const String privateKey = "0x1b93f6ca6ff89fc96f6c0e4384269df39fdbc274e4bdf181897e030310c0c187";

@freezed
class AkshitMadanEvent with _$AkshitMadanEvent {
  const factory AkshitMadanEvent.init(BuildContext context) = _InitialEventOnAkshitMadanEvent;

  const factory AkshitMadanEvent.refresh() = _RefreshEventOnAkshitMadanEvent;
}

@freezed
class AkshitMadanState with _$AkshitMadanState {
  const factory AkshitMadanState.initial() = InitialStateOnAkshitMadanState;

  const factory AkshitMadanState.inProgress() = InProgressStateOnAkshitMadanState;

  const factory AkshitMadanState.errorState() = ErrorStateOnAkshitMadanState;

  const factory AkshitMadanState.completed() = CompletedStateOnAkshitMadanState;
}

class AkshitMadanBloc extends Bloc<AkshitMadanEvent, AkshitMadanState> {
  // all this data are temporary

  List<TransactionModel> transactions = [];
  Web3Client? _web3Client;
  late ContractAbi _abiCode;
  late EthereumAddress _contractAddress;
  late EthPrivateKey _creds;
  int balance = 0;

  // Functions from solidity
  late DeployedContract _deployedContract;
  late ContractFunction _deposit;
  late ContractFunction _withdraw;
  late ContractFunction _getBalance;
  late ContractFunction _getAllTransactions;

  AkshitMadanBloc() : super(const AkshitMadanState.initial()) {
    //
    on<AkshitMadanEvent>(
      (event, emit) => event.map(
        init: (event) => _init(event, emit),
        refresh: (event) => _refresh(event, emit),
      ),
    );
  }

  void _init(
    _InitialEventOnAkshitMadanEvent event,
    Emitter<AkshitMadanState> emit,
  ) async {
    emit(AkshitMadanState.inProgress());

    _web3Client = Web3Client(
      rpcUrl,
      Client(),
      socketConnector: () {
        return IOWebSocketChannel.connect(socketUrl).cast<String>();
      },
    );

    final apiStringUrl = await DefaultAssetBundle.of(event.context).loadString(
      'truffle_artifacts/ExpenseManagerContract.json',
    );

    final abiJson = jsonDecode(apiStringUrl);

    final apiExtractedFromJson = jsonEncode(abiJson['abi']);

    // network address all that stuff, are from a ganache where you created a test project
    final contractAddress = EthereumAddress.fromHex(
      abiJson['networks']['5777']['address'],
    );

    _creds = EthPrivateKey.fromHex(privateKey);

    _deployedContract = DeployedContract(
      ContractAbi.fromJson(apiExtractedFromJson, "ExpenseManagerContract"),
      contractAddress,
    );

    // get deployed contract
    _deposit = _deployedContract.function("deposit");
    _withdraw = _deployedContract.function("withdraw");
    _getBalance = _deployedContract.function("getBalance");
    _getAllTransactions = _deployedContract.function("getAllTransactions");

    add(AkshitMadanEvent.refresh());
  }

  void _refresh(
    _RefreshEventOnAkshitMadanEvent event,
    Emitter<AkshitMadanState> emit,
  ) async {
    emit(AkshitMadanState.inProgress());

    final transactionsData = await _web3Client!.call(
      contract: _deployedContract,
      function: _getAllTransactions,
      params: [],
    );

    print(transactionsData);

    final balanceData = await _web3Client!.call(
      contract: _deployedContract,
      function: _getBalance,
      params: [
        EthereumAddress.fromHex(address),
      ],
    );

    List<TransactionModel> transactions = [];
    // first length "i < transactionsData[0].length" is temp
    // you can even write "i < transactionsData[1].length"
    // because from solidity comes several list from getAllTransactions function
    for (int i = 0; i < transactionsData[0].length; i++) {
      TransactionModel transactionModel = TransactionModel(
        transactionsData[0][i].toString(),
        transactionsData[1][i].toInt(),
        transactionsData[2][i],
        DateTime.fromMicrosecondsSinceEpoch(
          transactionsData[3][i].toInt(),
        ),
      );
      transactions.add(transactionModel);
    }

    this.transactions = transactions;

    balance = int.tryParse("${balanceData[0]}") ?? 0;

    emit(AkshitMadanState.completed());
  }
}
