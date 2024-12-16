import 'package:flutter/material.dart';
import 'package:flutter_crypto_test/home_widget.dart';
import 'package:flutter_crypto_test/life_meaning_provider.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const _MainApp());
}

class _MainApp extends StatelessWidget {
  const _MainApp();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LifeMeaningProvider(),
      child: MaterialApp(
        home: HomeWidget(),
      ),
    );
  }
}
