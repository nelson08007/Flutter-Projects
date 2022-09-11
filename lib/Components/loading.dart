import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 150,),
          Image.asset("assets/Logo.png",
            width: 200.0,
            height: 200.0,),
          Center(
            child: SpinKitRotatingCircle(
              color: Colors.green,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
