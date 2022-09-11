import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
class QrGenerator extends StatefulWidget {
  String? uid;


  QrGenerator(this.uid,);

  @override
  _QrGeneratorState createState() => _QrGeneratorState();
}

class _QrGeneratorState extends State<QrGenerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Qr generator",

        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: (){
            Navigator.pop(context);
          },

        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: QrImage(
            data: widget.uid!,
            backgroundColor: Colors.white,
            size: 300,
          ),
        ),
      ),
    );
  }
}
