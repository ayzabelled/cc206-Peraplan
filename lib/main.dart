import 'package:flutter/material.dart';
import 'package:peraplan/features/Transactions_Screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: TransactionsScreen(),
      ),
    );
  }
}
