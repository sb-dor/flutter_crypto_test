import 'package:flutter/material.dart';
import 'package:flutter_crypto_test/life_meaning_provider.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    super.initState();
    context.read<LifeMeaningProvider>().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Block-chain learning"),
      ),
    );
  }
}
