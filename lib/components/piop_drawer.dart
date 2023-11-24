import 'package:flutter/material.dart';
import 'package:peraplan/features/pera_in_out_page.dart';
import 'package:peraplan/features/Transactions_Screen.dart';
import 'package:google_fonts/google_fonts.dart';

class PIOPDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Drawer content goes here
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [hlblue, text]),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Icon in the drawer header
                const Icon(
                  Icons.menu_book_outlined,
                  color: Colors.white,
                  size: 64.0,
                ),
                SizedBox(width: small),
                Text('Quick Menu', style: drawHead),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.add,
              color: text,
            ),
            title: Text(
              'New Transaction',
              style: drawTxt,
            ),
            onTap: () {
              // Handle item 1 tap
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewTransaction()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.receipt_long,
              color: text,
            ),
            title: Text(
              'Transaction History',
              style: drawTxt,
            ),
            onTap: () {
              // Handle item 2 tap
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TransactionsScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

// Colors
var hlblue = const Color(0xFF0CC0DF);
var text = const Color(0xFF0FA3B1);
var white = const Color.fromARGB(255, 255, 255, 255);
var black = const Color.fromARGB(200, 0, 0, 0);

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
