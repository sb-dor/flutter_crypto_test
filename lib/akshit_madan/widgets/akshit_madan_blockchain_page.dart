import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crypto_test/akshit_madan/bloc/akshit_madan_bloc.dart';
import 'package:flutter_crypto_test/akshit_madan/widgets/deposite_page.dart';
import 'package:flutter_crypto_test/akshit_madan/widgets/withdraw_page.dart';

class AkshitMadanBlockchainPage extends StatefulWidget {
  const AkshitMadanBlockchainPage({super.key});

  @override
  State<AkshitMadanBlockchainPage> createState() => _AkshitMadanBlockchainPageState();
}

class _AkshitMadanBlockchainPageState extends State<AkshitMadanBlockchainPage> {
  @override
  void initState() {
    super.initState();
    context.read<AkshitMadanBloc>().add(AkshitMadanEvent.init());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Learning"),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          children: [
            Text("10 ETH"),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DepositePage(),
                        ),
                      );
                    },
                    child: Text("Debit"),
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WithdrawPage(),
                        ),
                      );
                    },
                    child: Text("Credit"),
                  ),
                ),
              ],
            ),
            Text("Transactions"),
            BlocBuilder<AkshitMadanBloc, AkshitMadanState>(
              builder: (context, state) {
                switch (state) {
                  case InitialStateOnAkshitMadanState():
                  case InProgressStateOnAkshitMadanState():
                  case ErrorStateOnAkshitMadanState():
                    return CircularProgressIndicator();
                  case CompletedStateOnAkshitMadanState():
                    return Expanded(
                      child: ListView.builder(
                        itemCount: state.transactions.length,
                        itemBuilder: (context, index) {
                          final transaction = state.transactions[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 6),
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12), color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      color: Colors.pink,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      '${transaction.amount} ETH',
                                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Text(
                                  transaction.address,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Text(
                                  transaction.reason,
                                  style: TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                          );
                        },
                      ),
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
