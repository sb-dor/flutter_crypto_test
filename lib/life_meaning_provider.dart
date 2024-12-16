import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

const String contractName = "LifeMeaning";
const String ip = "192.168.100.3";
const int port = 7545;
const String _rpcURL = "http://$ip:$port";
const String _wsUrl = "ws://$ip:$port";
const String _privateKey = "0x7c8775bed4e598d6f8d9a40d1f9779e6c56b092f5b53c9e5cc1e77190e0f88e2";

class LifeMeaningProvider extends ChangeNotifier {
  late final Web3Client _web3client;
  late final Credentials _credentials;
  late final DeployedContract _deployedContract;

  late final ContractFunction _getLifeMeaning;
  late final ContractFunction _setLifeMeaning;

  BigInt? lifeMeaning; // will get from contracts/LifeMeaning.sol
  bool loading = true;

  Future<void> init(BuildContext context) async {
    _web3client = Web3Client(
      _rpcURL,
      Client(), // from http
      socketConnector: () {
        return IOWebSocketChannel.connect(_wsUrl).cast<String>();
      },
    );

    final apiStringUrl = await DefaultAssetBundle.of(context).loadString(
      'build/contracts/LifeMeaning.json',
    );

    final abiJson = jsonDecode(apiStringUrl);

    final apiExtractedFromJson = jsonEncode(abiJson['abi']);

    final contractAddress = EthereumAddress.fromHex(
      abiJson['networks']['5777']['address'],
    );

    _credentials = EthPrivateKey.fromHex(_privateKey);

    _deployedContract = DeployedContract(
      ContractAbi.fromJson(apiExtractedFromJson, contractName),
      contractAddress,
    );

    _getLifeMeaning = _deployedContract.function('get'); // from contracts/LifeMeaning.sol

    _setLifeMeaning = _deployedContract.function('set'); // from contracts/LifeMeaning.sol

    await getMeaning();
  }

  Future<void> getMeaning() async {
    loading = true;

    notifyListeners();

    final result = await _web3client.call(
      contract: _deployedContract,
      function: _getLifeMeaning,
      params: [],
    );

    lifeMeaning = result[0];

    loading = false;

    notifyListeners();
  }

  Future<void> setMeaning(BigInt value) async {
    await _web3client.sendTransaction(
      _credentials,
      Transaction.callContract(
        contract: _deployedContract,
        function: _setLifeMeaning,
        parameters: [value],
      ),
    );

    getMeaning();
  }
}