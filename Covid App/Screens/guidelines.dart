import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:covid/Screens/home.dart';
import 'package:covid/Screens/testingcenters.dart';
import 'package:covid/constants.dart';
class Guidelines extends StatefulWidget {
  @override
  _GuidelinesState createState() => _GuidelinesState();
}
class _GuidelinesState extends State<Guidelines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      appBar: AppBar(
        backgroundColor:Colors.blue[900],
        elevation: 0.0,
        leading: Builder(builder: (context) => // Ensure Scaffold is in context
        IconButton(
            icon: Icon(Icons.menu,color: Colors.white,),
            onPressed: () => Scaffold.of(context).openDrawer()
        )),
        title: Text("HOME"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 30.0),
            ListTile(
              onTap: () {
                Navigator.of(context).push(  PageRouteTransition(
                    animationType: AnimationType.slide_left,
                    builder: (context) => Home()
                ));
              },
              leading: Icon(Icons.home, size: 20.0, color: c),
              title: Text("HOME",),
              dense: true,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(  PageRouteTransition(
                    animationType: AnimationType.slide_left,
                    builder: (context) => TestingCentre()
                ));
              },
              leading: Icon(Icons.science, size: 20.0, color:c),
              title: Text("TESTING CENTRES",),
              dense: true,
              // padding: EdgeInsets.zero,
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(  PageRouteTransition(
                    animationType: AnimationType.slide_left,
                    builder: (context) => Guidelines()
                ));
              },
              leading:
              Icon(Icons.build, size: 20.0, color: c),
              title: Text(" 14 Day-Quarantine",),
              dense: true,
              // padding: EdgeInsets.zero,
            ),
          ],
        ),

      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Image.asset("Assets/1.jpg"),
              ),
              Container(
                child: Image.asset("Assets/2.jpg"),
              ),
              Container(
                child: Image.asset("Assets/3.jpg"),
              ),
              Container(
                child: Image.asset("Assets/4.jpg"),
              ),
              Container(
                child: Image.asset("Assets/5.jpg"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
