import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crypto_test/akshit_madan/bloc/akshit_madan_bloc.dart';
import 'package:flutter_crypto_test/currencies_information/widgets/currencies_information_widget.dart';
import 'package:flutter_crypto_test/life_meaning/home_widget.dart';
import 'package:flutter_crypto_test/life_meaning/life_meaning_provider.dart';
import 'package:provider/provider.dart';

import 'akshit_madan/widgets/akshit_madan_blockchain_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const _AkshitMainApp());
}

class _AkshitMainApp extends StatelessWidget {
  const _AkshitMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AkshitMadanBloc(),
      child: MaterialApp(
        home: CurrenciesInformationWidget(),
      ),
    );
  }
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
