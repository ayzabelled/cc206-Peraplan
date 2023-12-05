// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peraplan/features/transactions_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:peraplan/data/database.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter());
  var _mybox = await Hive.openBox<Transaction>('transactions');
  runApp(const MainApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: TransactionsScreen(),
      ),
    );
  }
}
