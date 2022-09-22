
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

class Request extends StatefulWidget {


  @override
  _RequestState createState() => _RequestState();
}

class _RequestState extends State<Request> {
  int _index = 0;
  List<Widget> tabitem = [
    Center(
      child: Text("No Cash deposit request available for now! "),
    ),
    Center(
      child: Text("No Cash withdrawal request available for now! "),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Requests"),
      ),
      body: Center(
       child: tabitem[_index],
      ),
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linear,
        selectedIndex: _index,
        showElevation: false,
        onItemSelected: (index) => setState((){
          _index=index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.payments),
            title: Text("Deposit")
          ),
          FlashyTabBarItem(
              icon: Icon(Icons.payments),
              title: Text("Withdrawal")
          ),
        ],
      ),
    );
  }
}

