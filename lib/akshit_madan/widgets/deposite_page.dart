import 'package:flutter/material.dart';

class DepositePage extends StatefulWidget {
  const DepositePage({super.key});

  @override
  State<DepositePage> createState() => _DepositePageState();
}

class _DepositePageState extends State<DepositePage> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();

  @override
  void dispose() {
    _addressController.clear();
    _amountController.clear();
    _reasonController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        backgroundColor: Colors.green.shade50,
        title: Text("Deposite"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                hintText: "Enter the address",
              ),
            ),
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
              onPressed: () {},
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