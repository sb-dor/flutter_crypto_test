import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crypto_test/currencies_information/bloc/currencies_info_bloc.dart';
import 'package:flutter_crypto_test/currencies_information/factory/currencies_factory.dart';
import 'package:flutter_crypto_test/currencies_information/service/websocket_service.dart';

class CurrenciesInformationWidget extends StatefulWidget {
  const CurrenciesInformationWidget({super.key});

  @override
  State<CurrenciesInformationWidget> createState() => _CurrenciesInformationWidgetState();
}

class _CurrenciesInformationWidgetState extends State<CurrenciesInformationWidget> {
  CurrenciesInfoBloc? _currenciesBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto info sockets"),
      ),
      body: CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: ElevatedButton(
              onPressed: () {
                _currenciesBloc = CurrenciesFactory().create();
                _currenciesBloc?.add(CurrenciesInfoEvent.init());
                setState(() {

                });
              },
              child: Text("Start"),
            ),
          ),
          if (_currenciesBloc != null)
            BlocBuilder<CurrenciesInfoBloc, CurrenciesInfoState>(
              bloc: _currenciesBloc,
              builder: (context, state) {
                return SliverToBoxAdapter(
                  child: Text(state.data),
                );
              },
            ),
          if (_currenciesBloc != null)
            SliverToBoxAdapter(
              child: ElevatedButton(
                onPressed: () {
                  _currenciesBloc?.close();
                },
                child: Icon(Icons.remove),
              ),
            )
        ],
      ),
    );
  }
}
