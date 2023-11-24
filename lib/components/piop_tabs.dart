import 'package:flutter/material.dart';
import 'package:peraplan/components/piop_drawer.dart';
import 'package:peraplan/features/pera_in_out_page.dart';
import 'package:google_fonts/google_fonts.dart';

class PIOPTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
        body: TabBarView(
          children: [
            PeraIn(),
            PeraOut(),
          ],
        ),
        bottomNavigationBar: Container(
          child: TabBar(
            tabs: [
              Tab(
                  icon: Icon(Icons.add_circle_rounded, color: green),
                  child: Text('Pera In', style: txt)),
              Tab(
                  icon: Icon(Icons.remove_circle, color: red),
                  child: Text('Pera Out', style: txt)),
            ],
            indicatorColor: hlblue,
            indicatorWeight: 5,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
      ),
    );
  }
}

// Colors
var hlblue = const Color(0xFF0CC0DF);
var text = const Color(0xFF0FA3B1);
var white = Color.fromARGB(255, 255, 255, 255);
var black = Color.fromARGB(200, 0, 0, 0);
var green = const Color(0xFF0FB13C);
var red = const Color(0xFFB1360F);

// TextStyles
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
TextStyle drawTxt =
    GoogleFonts.lexend(fontSize: 14, fontWeight: FontWeight.w700, color: black);
TextStyle drawHead =
    GoogleFonts.lexend(fontSize: 24, fontWeight: FontWeight.w700, color: white);

// Gaps
var small = 16.0;
