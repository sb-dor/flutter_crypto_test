import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crypto_test/akshit_madan/bloc/akshit_madan_bloc.dart';

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({super.key});

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  // final TextEditingController _addressController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  @override
  void dispose() {
    // _addressController.clear();
    _amountController.clear();
    _reasonController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade50,
        title: Text("Withdraw"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // TextField(
            //   controller: _addressController,
            //   decoration: InputDecoration(
            //     hintText: "Enter the address",
            //   ),
            // ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(
                hintText: "Enter the amount",
              ),
            ),
            TextField(
              controller: _reasonController,
              decoration: InputDecoration(
                hintText: "Enter the reason",
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                context.read<AkshitMadanBloc>().add(
                      AkshitMadanEvent.withdraw(
                        int.tryParse(_amountController.text.trim()) ?? 0,
                        _reasonController.text.trim(),
                      ),
                    );
                Navigator.pop(context);
              },
              child: Text(
                "Deposite",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
