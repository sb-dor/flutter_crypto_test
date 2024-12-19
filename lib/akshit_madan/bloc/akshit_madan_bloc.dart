import 'dart:convert';
import 'dart:developer';

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

const String address = "0x381eD9FD189b71F4a22C4257dCd535351E521e41";
const String privateKey = "0xbe79a1c28d6e0c4c81127c5c050bcbbe6d8db77aea3e126da3b347424674ccd4";

@freezed
class AkshitMadanEvent with _$AkshitMadanEvent {
  const factory AkshitMadanEvent.init() = _InitialEventOnAkshitMadanEvent;

  const factory AkshitMadanEvent.deposit(int number, String reason) =
      _DepositeEventOnAkshitMadanEvent;

  const factory AkshitMadanEvent.withdraw(int number, String reason) =
      _WithdrawEventOnAkshitMadanEvent;

  const factory AkshitMadanEvent.refresh() = _RefreshEventOnAkshitMadanEvent;
}

@freezed
sealed class AkshitMadanState with _$AkshitMadanState {
  const factory AkshitMadanState.initial() = InitialStateOnAkshitMadanState;

  const factory AkshitMadanState.inProgress() = InProgressStateOnAkshitMadanState;

  const factory AkshitMadanState.errorState() = ErrorStateOnAkshitMadanState;

  const factory AkshitMadanState.completed(
    List<TransactionModel> transactions,
    int balance,
  ) = CompletedStateOnAkshitMadanState;
}

class AkshitMadanBloc extends Bloc<AkshitMadanEvent, AkshitMadanState> {
  // all this data are temporary

  Web3Client? _web3Client;
  late ContractAbi _abiCode;
  late EthereumAddress _contractAddress;
  late EthPrivateKey _creds;

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
        deposit: (event) => _depositEvent(event, emit),
        withdraw: (event) => _withdrawEvent(event, emit),
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

    final abiFile = await rootBundle.loadString(
      'truffle_artifacts/ExpenseManagerContract.json',
    );

    var jsonDecoded = jsonDecode(abiFile);

    _abiCode = ContractAbi.fromJson(
      jsonEncode(jsonDecoded['abi']),
      "ExpanseManagerContract",
    );

    _contractAddress = EthereumAddress.fromHex(
      jsonDecoded['networks']['5777']['address'],
    );

    _creds = EthPrivateKey.fromHex(privateKey);

    _deployedContract = DeployedContract(_abiCode, _contractAddress);

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

    print("balance: ${balanceData}");

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

    final balance = int.tryParse("${balanceData[0]}") ?? 0;

    emit(AkshitMadanState.completed(transactions, balance));
  }

  void _depositEvent(
    _DepositeEventOnAkshitMadanEvent event,
    Emitter<AkshitMadanState> emit,
  ) async {
    final transaction = Transaction.callContract(
      contract: _deployedContract,
      function: _deposit,
      parameters: [
        BigInt.from(event.number),
        event.reason,
      ],
    );

    final result = await _web3Client!.sendTransaction(
      _creds,
      transaction,
      fetchChainIdFromNetworkId: false,
      chainId: 1337,
    );

    log(result);

    add(AkshitMadanEvent.refresh());
  }

  void _withdrawEvent(
    _WithdrawEventOnAkshitMadanEvent event,
    Emitter<AkshitMadanState> emit,
  ) async {
    final transaction = Transaction.callContract(
      contract: _deployedContract,
      function: _withdraw,
      parameters: [
        BigInt.from(event.number),
        event.reason,
      ],
    );

    final result = await _web3Client!.sendTransaction(
      _creds,
      transaction,
      chainId: 1337,
      fetchChainIdFromNetworkId: false,
    );

    print(result);

    add(AkshitMadanEvent.refresh());
  }
}
