
import 'package:cashtroopsdemo/Screens/cashsend1.dart';
import 'package:flutter/material.dart';


class Virat extends StatefulWidget {


  @override
  _ViratState createState() => _ViratState();
}

class _ViratState extends State<Virat> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Virat"),
        actions: [
          Row(
            children: [
              Icon(
                Icons.call
              ),
              SizedBox(width:12)
            ],
          )
        ],
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: (){
 Navigator.push(context, MaterialPageRoute(builder: (context) => SendMoneyPage1() ));
          },
          icon: Icon(
              Icons.payments,
              color: Colors.red
          ),
          label: Text("Request",
            style: TextStyle(
                color: Colors.white
            ),
          )
      ),
      body: Container(),
    );
  }
}
