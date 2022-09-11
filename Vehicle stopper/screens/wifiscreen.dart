import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';







class WifiScreen extends StatefulWidget {

  @override
  _WifiScreenState createState() => _WifiScreenState();
}

class _WifiScreenState extends State<WifiScreen> {
  bool isSearching=false;
  bool clr =true;
  final snackBar1= SnackBar(content: Text("Bike is Turned OFF"),);
  final snackBar2= SnackBar(content: Text("Bike is Turned ON"),);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        backgroundColor: Colors.white,
        body: Container(
          constraints: BoxConstraints.expand(),
          //decoration: BoxDecoration(
          //    image: DecorationImage(
          //       image: AssetImage("assets/images/Nelbg.jpg"),
          //      fit: BoxFit.cover)
          // ),
          child: ListView(
            itemExtent: 100,
            //Fraction: -0.4,
            // squeeze: 0.8,
            //clipToSize: true,
            children: [
             // SizedBox(
              //  height: 1,
             // ),
              Card(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                     ListTile(
                      leading: IconButton( icon : Icon(Icons.directions_bike,
                        size:40, color: clr ? Colors.red : Colors.green,
                      ),

                      splashColor: Colors.white,
                      splashRadius: 10,
                      onPressed: (){
                        this.clr=!this.clr;
                        clr ? Scaffold.of(context).showSnackBar(snackBar1) : Scaffold.of(context).showSnackBar(snackBar1);
                      },
                      ),
                      //CircleAvatar(
                      //backgroundImage: AssetImage('assets/images/Nelavatar.png'),
                      //radius: 30,)

                      trailing: IconButton(icon: Icon(Icons.location_on_rounded,
                        size: 40, color: Colors.black),
                        splashColor: Colors.white,
                        splashRadius: 10,
                          onPressed: (){
                            MapsLauncher.launchCoordinates(9.902562, 78.098417);
          },),
                      title: Text('TN 59 M 6439',
                        style: TextStyle(
                          color: Colors.black,
                        ),),
                      subtitle: Text(" Press icons to stop and track"
                          ,
                        style: TextStyle(
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}