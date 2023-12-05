import 'package:flutter/material.dart';
import 'package:peraplan/features/pera_in_out_page.dart';
import 'package:peraplan/features/Transactions_Screen.dart';
import 'package:peraplan/utils/styles.dart';

class PIOPDrawer extends StatelessWidget {
  const PIOPDrawer({super.key});

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
                Icon(
                  Icons.menu_book_outlined,
                  color: white,
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
