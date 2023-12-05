// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:peraplan/components/piop_drawer.dart';
import 'package:peraplan/utils/styles.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  String selectedButton = 'All Transactions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text.rich(TextSpan(
          children: [
            TextSpan(text: 'Pera', style: appBar1),
            TextSpan(
              text: 'Plan',
              style: appBar2,
            ),
          ],
        )),
        iconTheme: IconThemeData(color: hlblue),
      ),
      drawer: const PIOPDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Transaction History', style: headers),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton(context, 'All Transactions', tCat, text),
                  _buildButton(context, 'Pera In', tIn, green),
                  _buildButton(context, 'Pera Out', tOut, red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String label,
    TextStyle textStyle,
    Color borderColor,
  ) {
    final isSelected = selectedButton == label;
    return InkWell(
      onTap: () {
        setState(() {
          selectedButton = label;
        });
        if (label == 'All Transactions') {
          // Show all transaction history
        } else if (label == 'Pera In') {
          // Show only Pera In transaction history
        } else if (label == 'Pera Out') {
          // Show only Pera Out transaction history
        }
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle, // Make the container rectangular
          border:
              isSelected ? Border.all(width: 2.5, color: borderColor) : null,
          borderRadius: BorderRadius.circular(12),
          color: mgray, // Background color
        ),
        child: Text(
          label,
          style: textStyle.copyWith(
              color: isSelected ? borderColor : null), // Border color
        ),
      ),
    );
  }
}
