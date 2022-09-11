import 'package:box_aload/Components/dark.dart';
import 'package:flutter/material.dart';
import 'package:box_aload/Authentication/Signin.dart';
import 'package:box_aload/DesktopScreens/Contactdes.dart';
import 'package:box_aload/DesktopScreens/Homedes.dart';
import 'package:box_aload/DesktopScreens/Ridersdes.dart';
import 'package:box_aload/DesktopScreens/Advertiserdes.dart';

class Teamdes extends StatefulWidget {
  @override
  _TeamdesState createState() => _TeamdesState();
}

class _TeamdesState extends State<Teamdes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(

            backgroundColor: Theme.of(context).primaryColor,
            elevation: 10.0,
            leading: Builder(builder: (context) => // Ensure Scaffold is in context
            IconButton(
                icon: Icon(Icons.menu,  ),
                onPressed: () => Scaffold.of(context).openDrawer()
            )),
            title:   Image.asset("assets/Logo.png",
              width: 80.0,
              height: 80.0,
            ),
            actions : [
              TextButton(
                onPressed: () async {
                  //await launch("https://youtu.be/4z-vlj_caOU");
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Homedes() ));
                },
                child: Text('Home',
                  style: TextStyle(
                      
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(width: 32),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Addes() ));
                },
                child: Text('Advertiser',
                  style: TextStyle(
                      
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(width: 32),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Ridersdes() ));
                },
                child: Text('Rider',
                  style: TextStyle(
                      
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(width: 32),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Teamdes() ));
                },

                child: Text('Team',
                  style: TextStyle(
                      
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(width: 32),
              TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Contactdes() ));
                },
                child: Text('Contact',
                  style: TextStyle(
                      
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(width: 64),
            ]
        ),
      ),
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        child: Drawer(
          child: SafeArea(
            child: Container(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    height: 80.0,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/Logo.png",
                          // width: 200.0,
                          // height: 200.0,
                        ),
                        SizedBox(width: 40,),
                      ],
                    ),),
                  Container(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Homedes() ));
                      },
                      leading: Icon(Icons.home, size: 20.0,color: Colors.green, ),
                      title: Text("Home",style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),),
                      dense: true,
                    ),
                  ),
                  Container(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Ridersdes() ));
                      },
                      leading: Icon(Icons.pedal_bike, size: 20.0,color: Colors.green,),
                      title: Text("Riders",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),),
                      dense: true,
                      // padding: EdgeInsets.zero,
                    ),
                  ),
                  Container(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Addes() ));
                      },
                      leading:
                      Icon(Icons.campaign, size: 20.0,color: Colors.green,),
                      title: Text("Advertisers",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),),
                      dense: true,
                      // padding: EdgeInsets.zero,
                    ),
                  ),
                  Container(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Teamdes() ));
                      },
                      leading:
                      Icon(Icons.group, size: 20.0,color: Colors.green,),
                      title: Text("Team",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),),
                      dense: true,
                      // padding: EdgeInsets.zero,
                    ),
                  ),
                  Container(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Contactdes() ));
                      },
                      leading:
                      Icon(Icons.contact_mail, size: 20.0,color: Colors.green,),
                      title: Text("Contact",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),),
                      dense: true,
                      // padding: EdgeInsets.zero,
                    ),
                  ),
                  Container(
                    child: ListTile(
                      leading:
                      Icon(Icons.nightlight_round, size: 20.0,color: Colors.green,),
                      title: Text("Darkmode",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),),
                      trailing: ChangeThemeButtonWidget(),
                      dense: true,
                      // padding: EdgeInsets.zero,
                    ),
                  ),
                  Container(
                    height: 400,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn() ));
          },
          icon: Icon(
              Icons.person,
              color: Colors.green
          ),
          label: Text("REGISTER",
            style: TextStyle(
                color: Colors.white
            ),
          )
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
          child: SingleChildScrollView(
              child: Column(children: [

                Row(
                  children: [
                    Image.asset("assets/person.png",
                      width: 400.0,
                      height: 400.0,
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Column(
                          children:[
                            SizedBox(height : 20 ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(" Person 1 ",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.green,
                                      fontWeight: FontWeight.w700, fontSize: 25)),),
                            SizedBox(height : 20 ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(" Luca is responsible for the strategy and the implementation of national and regional campaigns at Working Bicycle. He studied business administration at the University of Applied Sciences Northwestern Switzerland, specializing in entrepreneurship and controlling ", style: TextStyle(   fontSize: 20, fontWeight: FontWeight.bold )),),
                            SizedBox(height : 20 ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text("person1@gmail.com", textAlign: TextAlign.center, style: TextStyle(   fontWeight: FontWeight.bold, fontSize: 22)),),
                            SizedBox(height : 20 ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Text("1234567890", textAlign: TextAlign.center, style: TextStyle(   fontWeight: FontWeight.bold, fontSize: 22)),),
                            SizedBox(height : 40 ),
                          ]
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                    children:[
                    SizedBox(height : 20 ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(" Person 2 ", textAlign: TextAlign.center, style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700, fontSize: 25)),),
                    SizedBox(height : 20 ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(" Luca is responsible for the strategy and the implementation of national and regional campaigns at Working Bicycle. He studied business administration at the University of Applied Sciences Northwestern Switzerland, specializing in entrepreneurship and controlling ", style: TextStyle(   fontSize: 20, fontWeight: FontWeight.bold )),),
                    SizedBox(height : 20 ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("person2@gmail.com", textAlign: TextAlign.center, style: TextStyle(   fontWeight: FontWeight.bold, fontSize: 22)),),
                    SizedBox(height : 20 ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("1234567890", textAlign: TextAlign.center, style: TextStyle(   fontWeight: FontWeight.bold, fontSize: 22)),),
                    SizedBox(height : 40 ),
                  ]
                ),
                    ),
                    SizedBox(width: 30),
                    Image.asset("assets/person.png",
                      width: 400.0,
                      height: 400.0,
                    ),
                  ],
                ),
                SizedBox(height: 40),

              ])

          )
      ),
    );
  }
}
