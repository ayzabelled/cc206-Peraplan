import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peraplan/components/piop_drawer.dart';
import 'package:peraplan/components/piop_tabs.dart';

class NewTransaction extends StatelessWidget {
  const NewTransaction({super.key});

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
        bottomNavigationBar: PIOPTab(),
        body: SingleChildScrollView(
          child: Column(children: []),
        ));
  }
}

class PeraIn extends StatelessWidget {
  const PeraIn({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('Pera In', style: pIn)],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20.0),
          width: width * .7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [hlblue, text]),
              boxShadow: [
                BoxShadow(
                    color: dgray,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: const Offset(2, 2)),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textAlign: TextAlign.left,
                cursorColor: green,
                style: amount,
                decoration: InputDecoration(
                  hintText: 'Enter Amount...',
                  hintStyle: amount,
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: large),
        Container(
          padding: const EdgeInsets.all(20.0),
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('Details', style: boldHeader)],
          ),
        ),
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
              Row(
                children: [
                  Text('Date:', style: txt),
                  SizedBox(width: xxsmall),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: white,
                          ),
                        ),
                        TextFormField(
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          textAlign: TextAlign.center,
                          cursorColor: hlblue,
                          style: txt,
                          decoration: InputDecoration(
                            hintText: 'MM/DD/YYYY',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: small),
                  Text('Time:', style: txt),
                  SizedBox(width: xxsmall),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: white,
                          ),
                        ),
                        TextFormField(
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          textAlign: TextAlign.center,
                          cursorColor: hlblue,
                          style: txt,
                          decoration: InputDecoration(
                            hintText: 'HH:MM',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: small),
              Row(
                children: [
                  Text('Category:', style: txt),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: lgray,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        DropdownButtonFormField<String>(
                          hint: Text(
                            'Select Category',
                            textAlign: TextAlign.center,
                          ),
                          onChanged: (String? newValue) {},
                          items: <String>[
                            'Salary',
                            'Allowance',
                            'Investments',
                            'Others'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: drawTxt,
                              ),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 10.0),
                          ),
                          style: txt,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: medium),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Submit Input 1
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: green,
                        minimumSize: Size(186, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    child: Text('Pera In', style: enter),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class PeraOut extends StatelessWidget {
  const PeraOut({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20.0),
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('Pera Out', style: pOut)],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20.0),
          width: width * .7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [hlblue, text]),
              boxShadow: [
                BoxShadow(
                    color: dgray,
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: const Offset(2, 2)),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                textAlign: TextAlign.left,
                cursorColor: green,
                style: amount,
                decoration: InputDecoration(
                  hintText: 'Enter Amount...',
                  hintStyle: amount,
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: large),
        Container(
          padding: const EdgeInsets.all(20.0),
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('Details', style: boldHeader)],
          ),
        ),
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
              Row(
                children: [
                  Text('Date:', style: txt),
                  SizedBox(width: xxsmall),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: white,
                          ),
                        ),
                        TextFormField(
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          textAlign: TextAlign.center,
                          cursorColor: hlblue,
                          style: txt,
                          decoration: InputDecoration(
                            hintText: 'MM/DD/YYYY',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: small),
                  Text('Time:', style: txt),
                  SizedBox(width: xxsmall),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: white,
                          ),
                        ),
                        TextFormField(
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          textAlign: TextAlign.center,
                          cursorColor: hlblue,
                          style: txt,
                          decoration: InputDecoration(
                            hintText: 'HH:MM',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: small),
              Row(
                children: [
                  Text('Category:', style: txt),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: lgray,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        DropdownButtonFormField<String>(
                          hint: Text(
                            'Select Category',
                            textAlign: TextAlign.center,
                          ),
                          onChanged: (String? newValue) {},
                          items: <String>[
                            'Food',
                            'Travel',
                            'School',
                            'Others',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: drawTxt,
                              ),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 10.0),
                          ),
                          style: txt,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: medium),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Submit Input 1
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: red,
                        minimumSize: Size(186, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                    child: Text('Pera Out', style: enter),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

// Colors
var hlblue = const Color(0xFF0CC0DF);
var text = const Color(0xFF0FA3B1);
var icon = const Color(0xFFB8BCCB);
var white = Color.fromARGB(255, 255, 255, 255);
var gray = const Color(0xFFE3E3E3);
var dgray = const Color(0x65000000);
var black = Color.fromARGB(200, 0, 0, 0);
var mgray = Color.fromARGB(0, 227, 220, 220);
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
