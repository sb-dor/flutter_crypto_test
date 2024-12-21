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
  late CurrenciesInfoBloc _currenciesBloc;

  @override
  void initState() {
    super.initState();
    _currenciesBloc = CurrenciesFactory().create();
    _currenciesBloc.add(CurrenciesInfoEvent.init());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto info sockets"),
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          slivers: [
            BlocBuilder<CurrenciesInfoBloc, CurrenciesInfoState>(
              bloc: _currenciesBloc,
              builder: (context, state) {
                switch (state) {
                  case InProgressStateOnCurrenciesInfoState():
                    return SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator.adaptive()),
                    );
                  case CompletedStateOnCurrenciesInfoState():
                    if (state.currencies.isEmpty) {
                      return SliverFillRemaining(
                        child: Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      );
                    }
                    return SliverList.separated(
                      separatorBuilder: (context, index) => SizedBox(height: 5),
                      itemCount: state.currencies.length,
                      itemBuilder: (context, index) {
                        final currency = state.currencies[index];
                        return Card(
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Instrument Name and Market
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      currency.instrument ?? '',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      currency.market ?? '',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
        
                                // Current Value
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Value: \$${currency.value?.toStringAsFixed(2)}",
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                    Icon(
                                      currency.valueFlag == "UP"
                                          ? Icons.arrow_upward
                                          : Icons.arrow_downward,
                                      color: currency.valueFlag == "UP" ? Colors.green : Colors.red,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
        
                                // Hourly High and Low
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "High: \$${currency.currentHourHigh?.toStringAsFixed(2)}",
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      "Low: \$${currency.currentHourLow?.toStringAsFixed(2)}",
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
        
                                // Hourly Change Percentage
                                Text(
                                  "Change: ${currency.currentHourChangePercentage?.toStringAsFixed(2)}%",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: (currency.currentHourChangePercentage ?? 0.0) >= 0
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                                const SizedBox(height: 10),
        
                                // Last Update Time
                                Text(
                                  "Last Updated: ${DateTime.fromMillisecondsSinceEpoch((currency.lastUpdateTimestamp ?? 0) * 1000)}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
