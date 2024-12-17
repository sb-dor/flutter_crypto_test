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
    context.read<AkshitMadanBloc>().add(AkshitMadanEvent.init(context));
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
          ],
        ),
      ),
    );
  }
}
