import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({Key? key});

  @override
  _TransactionsScreenState createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  String selectedButton = 'All Transactions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Pera', style: titlePera),
                    TextSpan(
                      text: 'Plan',
                      style: titlePlan,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Center(
            // Center the buttons
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the buttons horizontally
              children: [
                _buildButton(context, 'All Transactions', tCat, text),
                _buildButton(context, 'Pera In', tIn, green),
                _buildButton(context, 'Pera Out', tOut, red),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String label, TextStyle textStyle,
      Color borderColor) {
    final isSelected = selectedButton == label;
    return InkWell(
      onTap: () {
        // Handle button tap based on the label
        setState(() {
          selectedButton = label;
        });
        if (label == 'All Transactions') {
        } else if (label == 'Pera In') {
          // Handle 'Pera In' button tap
        } else if (label == 'Pera Out') {
          // Handle 'Pera Out' button tap
        }
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle, // Make the container rectangular
          border:
              isSelected ? Border.all(width: 2.5, color: borderColor) : null,
          borderRadius: BorderRadius.circular(10),
          color: gray, // Background color
        ),
        child: Text(
          label,
          style: textStyle.copyWith(
              color: isSelected ? borderColor : null), // Border color
        ),
      ),
    );
  }

  // TextStyles
  TextStyle titlePera = GoogleFonts.lexend(
      fontSize: 64, fontWeight: FontWeight.w700, color: hlblue);
  TextStyle titlePlan = GoogleFonts.lexend(
      fontSize: 64, fontWeight: FontWeight.w700, color: text);

  TextStyle tIn = GoogleFonts.lexend(
      fontSize: 15, fontWeight: FontWeight.w600, color: green);
  TextStyle tOut =
      GoogleFonts.lexend(fontSize: 15, fontWeight: FontWeight.w600, color: red);
  TextStyle tCat = GoogleFonts.lexend(
      fontSize: 14, fontWeight: FontWeight.w600, color: text);
}

var hlblue = const Color(0xFF0CC0DF);
var text = const Color(0xFF0FA3B1);
var gray = const Color(0xFFE3E3E3);
var lgray = const Color(0x35E3DCDC);
var green = const Color(0xFF0FB13C);
var red = const Color(0xFFB1360F);
