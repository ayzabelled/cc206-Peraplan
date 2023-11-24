import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peraplan/features/pera_in_out_page.dart';
import 'package:peraplan/features/transactions_screen.dart';

void main() {
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
