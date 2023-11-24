// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peraplan/components/piop_drawer.dart';

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
      drawer: PIOPDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Transaction History', style: boldHeader),
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

// Colors
var hlblue = const Color(0xFF0CC0DF);
var text = const Color(0xFF0FA3B1);
var icon = const Color(0xFFB8BCCB);
var white = const Color.fromARGB(255, 255, 255, 255);
var gray = const Color(0xFFE3E3E3);
var dgray = const Color(0x65000000);
var black = const Color.fromARGB(200, 0, 0, 0);
var mgray = const Color.fromARGB(0, 227, 220, 220);
var lgray = const Color(0x35E3DCDC);
var green = const Color(0xFF0FB13C);
var red = const Color(0xFFB1360F);
// TextStyles
TextStyle titlePera = TextStyle(
    fontFamily: 'Batangas',
    fontSize: 64,
    fontWeight: FontWeight.w700,
    color: hlblue);
TextStyle titlePlan = TextStyle(
    fontFamily: 'Batangas',
    fontSize: 64,
    fontWeight: FontWeight.w700,
    color: text);
TextStyle appBar1 = TextStyle(
    fontFamily: 'Batangas',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: hlblue);
TextStyle appBar2 = TextStyle(
    fontFamily: 'Batangas',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: text);
TextStyle amount =
    GoogleFonts.lexend(fontSize: 32, fontWeight: FontWeight.w700, color: white);
TextStyle enter =
    GoogleFonts.lexend(fontSize: 24, fontWeight: FontWeight.w700, color: white);
TextStyle pIn =
    GoogleFonts.lexend(fontSize: 24, fontWeight: FontWeight.w700, color: green);
TextStyle pOut =
    GoogleFonts.lexend(fontSize: 24, fontWeight: FontWeight.w700, color: red);
TextStyle hintAmt =
    GoogleFonts.lexend(fontSize: 22, fontWeight: FontWeight.w700, color: dgray);
TextStyle drawTxt =
    GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w700, color: black);
TextStyle txt = GoogleFonts.lexend(
    fontSize: 15, fontWeight: FontWeight.w700, color: hlblue);
TextStyle drawHead =
    GoogleFonts.lexend(fontSize: 24, fontWeight: FontWeight.w700, color: white);
TextStyle header = GoogleFonts.lexend(
    fontSize: 24, fontWeight: FontWeight.w400, color: hlblue);
TextStyle boldHeader = GoogleFonts.lexend(
    fontSize: 24, fontWeight: FontWeight.w700, color: hlblue);

TextStyle tIn =
    GoogleFonts.lexend(fontSize: 15, fontWeight: FontWeight.w600, color: green);
TextStyle tOut =
    GoogleFonts.lexend(fontSize: 15, fontWeight: FontWeight.w600, color: red);
TextStyle tCat =
    GoogleFonts.lexend(fontSize: 15, fontWeight: FontWeight.w600, color: text);
TextStyle tagline = GoogleFonts.lexend(
    fontSize: 12, fontWeight: FontWeight.normal, color: text);

TextStyle button = GoogleFonts.lexend(
    fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white);

// Gaps
var xxxlarge = 150.0;
var xxlarge = 100.0;
var xlarge = 80.0;
var large = 50.0;
var medium = 30.0;
var small = 16.0;
var xsmall = 10.0;
var xxsmall = 5.0;
var cont = 330.0;
