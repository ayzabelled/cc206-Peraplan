import 'package:flutter/material.dart';
import 'package:peraplan/components/piop_drawer.dart';
import 'package:peraplan/features/pera_in_out_page.dart';

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