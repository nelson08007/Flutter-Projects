import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:stopper/screens/loginscreen.dart';
import 'package:maps_launcher/maps_launcher.dart';


class PersonalScreen extends StatefulWidget {
  @override
  _PersonalScreenState createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  bool isSwitched =true;
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
      itemExtent: 130,
      //Fraction: -0.4,
      // squeeze: 0.8,
      //clipToSize: true,
      children: [
        Container(
          height: 100.0,
          child: Stack(
            children: <Widget>[
              //Container(),
              ClipPath(
                clipper: MyCustomClipper(),
                child: Container(
                  color: Colors.black,
                  height: 100.0,
                ),
              ),
              Align(
                alignment: Alignment(0, 1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircularProfileAvatar(
                      "",
                      child: Image(image: AssetImage("assets/images/ybx.png"),),
                      borderWidth: 4.0,
                      radius: 40.0,
                    ),
                    //SizedBox(height: 4.0),
                    Text(
                      "Yamaha YBX",
                      style: TextStyle(
                        fontSize: 21.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "TN 59 M 6439",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              TopBar(),
            ],
          ),
        ),

        // SizedBox(
        //  height: 1,
        // ),

        Card(
          margin: EdgeInsets.fromLTRB(10, 20, 5, 20),
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon( Icons.person,
                size:40,),
                //CircleAvatar(
                //backgroundImage: AssetImage('assets/images/Nelavatar.png'),
                //radius: 30,)

                //  trailing: IconButton(icon: Icon(Icons.location_on_rounded, size: 40, color: Colors.black), splashColor: Colors.white, splashRadius: 10, onPressed: (){},),
                title: Text('Jagatheeshwar',
                  style: TextStyle(
                    color: Colors.black,
                  ),),
                subtitle: Text(" Owner"
                  ,
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.fromLTRB(10, 10, 5, 30),
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon( Icons.directions_bike,
                size: 40,),
                //CircleAvatar(
                //backgroundImage: AssetImage('assets/images/Nelavatar.png'),
                //radius: 30,)

                //  trailing: IconButton(icon: Icon(Icons.location_on_rounded, size: 40, color: Colors.black), splashColor: Colors.white, splashRadius: 10, onPressed: (){},),
                title: Text('Two wheeler',
                  style: TextStyle(
                    color: Colors.black,
                  ),),
                subtitle: Text(" Vehicle Type"
                  ,
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.fromLTRB(10, 0, 5, 30),
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon( Icons.location_on_rounded,
                size:40,),
                //CircleAvatar(
                //backgroundImage: AssetImage('assets/images/Nelavatar.png'),
                //radius: 30,)

                trailing: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  color: Colors.greenAccent,
                  child: Text("Locate"),
                  textColor: Colors.black,
                  onPressed: (){
                   MapsLauncher.launchCoordinates(9.902562, 78.098417);
                  },
                ),
                title: Text('Location',
                  style: TextStyle(
                    color: Colors.black,
                  ),),
                subtitle: Text(" Press locate button"
                  ,
                  style: TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.fromLTRB(10,0, 5, 40),
          color: Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon( Icons.directions_bike,
                size: 40,),
                //CircleAvatar(
                //backgroundImage: AssetImage('assets/images/Nelavatar.png'),
                //radius: 30,)

                trailing: Switch(
                  activeColor: Colors.green,

                  inactiveThumbColor: Colors.red,

                  value: isSwitched,
                  onChanged: (value){
                    setState(() {
                      isSwitched=value;
                    });
                    isSwitched ? Scaffold.of(context).showSnackBar(snackBar2) : Scaffold.of(context).showSnackBar(snackBar2);
                  },

                ),
                title: Text('Control',
                  style: TextStyle(
                    color: Colors.black,
                  ),),
                subtitle: Text("Use switch to ON/OFF"
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


class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 100 );
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}


class TopBar extends StatelessWidget {
  const TopBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),

        ],
      ),
    );
  }
}