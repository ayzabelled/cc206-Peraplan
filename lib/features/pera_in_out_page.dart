import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PeraInOutPage extends StatelessWidget {
  const PeraInOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: xlarge),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
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
              SizedBox(height: xlarge),
              Container(
                padding: const EdgeInsets.all(20.0),
                width: width * .9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: white,
                    boxShadow: [
                      BoxShadow(
                          color: dgray,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: const Offset(2, 2)),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pera In', style: pIn),
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: lgray,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              TextFormField(
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                textAlign: TextAlign.left,
                                cursorColor: green,
                                style: inpAmt,
                                decoration: InputDecoration(
                                  hintText: 'Enter Amount...',
                                  hintStyle: hintAmt,
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: lgray,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Submit Input 1
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.green),
                                ),
                                child: Text('Pera In', style: button),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: medium),
                    Text('Pera Out', style: pOut),
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  color: lgray,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              TextFormField(
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                textAlign: TextAlign.left,
                                cursorColor: red,
                                style: outAmt,
                                decoration: InputDecoration(
                                  hintText: 'Enter Amount...',
                                  hintStyle: hintAmt,
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: lgray,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  // Submit Input 1
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red),
                                ),
                                child: Text('Pera Out', style: button),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

// Colors
var hlblue = const Color(0xFF0CC0DF);
var text = const Color(0xFF0FA3B1);
var icon = const Color(0xFFB8BCCB);
var white = Color.fromARGB(255, 255, 255, 255);
var gray = const Color(0xFFE3E3E3);
var dgray = const Color(0x65000000);
var mgray = Color.fromARGB(0, 227, 220, 220);
var lgray = const Color(0x35E3DCDC);
var green = const Color(0xFF0FB13C);
var red = const Color(0xFFB1360F);

// TextStyles
TextStyle titlePera = GoogleFonts.lexend(
    fontSize: 64, fontWeight: FontWeight.w700, color: hlblue);
TextStyle titlePlan =
    GoogleFonts.lexend(fontSize: 64, fontWeight: FontWeight.w700, color: text);
TextStyle inpAmt =
    GoogleFonts.lexend(fontSize: 24, fontWeight: FontWeight.w700, color: text);
TextStyle outAmt =
    GoogleFonts.lexend(fontSize: 24, fontWeight: FontWeight.w700, color: text);
TextStyle pIn =
    GoogleFonts.lexend(fontSize: 20, fontWeight: FontWeight.w700, color: green);
TextStyle pOut =
    GoogleFonts.lexend(fontSize: 18, fontWeight: FontWeight.w700, color: red);
TextStyle hintAmt =
    GoogleFonts.lexend(fontSize: 22, fontWeight: FontWeight.w700, color: dgray);

TextStyle tIn =
    GoogleFonts.lexend(fontSize: 15, fontWeight: FontWeight.w600, color: green);
TextStyle tOut =
    GoogleFonts.lexend(fontSize: 15, fontWeight: FontWeight.w600, color: red);
TextStyle tCat =
    GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w600, color: text);
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
