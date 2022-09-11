import 'package:box_aload/Components/dark.dart';
import 'package:flutter/material.dart';
import 'package:box_aload/Authentication/Signin.dart';
import 'package:box_aload/MobileScreens/Homemob.dart';
import 'package:box_aload/MobileScreens/Ridersmob.dart';
import 'package:box_aload/MobileScreens/Teammob.dart';
import 'package:box_aload/MobileScreens/Advertisermob.dart';

class Contactmob extends StatefulWidget {
  @override
  _ContactmobState createState() => _ContactmobState();
}

class _ContactmobState extends State<Contactmob> {
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Homemob() ));
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Ridersmob() ));
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Admob() ));
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Teammob() ));
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Contactmob() ));
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
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
          child: SingleChildScrollView(
              child: Column(children: [
                Center(child: Image.asset("assets/contact.png")),
                SizedBox(height : 40 ),
                Row(
                    children:[
                      Text("Email ", textAlign: TextAlign.left, style: TextStyle(color: Colors.green , fontWeight: FontWeight.w700, fontSize: 20)),
                      SizedBox(width: 10),
                      Icon(Icons.email, color: Colors.green),
                    ]
                ),

                SizedBox(height : 15 ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(" boxaload@gmail.com ", style: TextStyle(   fontSize: 15, fontWeight: FontWeight.bold )),),
                SizedBox(height : 20 ),
                Row(
                    children:[
                      Text("Phone ", textAlign: TextAlign.left, style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700, fontSize: 20)),
                      SizedBox(width: 10),
                      Icon(Icons.call , color: Colors.green),
                    ]
                ),
                SizedBox(height : 15 ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(" 123456789 ", style: TextStyle(   fontSize: 15, fontWeight: FontWeight.bold )),),
                SizedBox(height : 20 ),

                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(" 123456789 ", style: TextStyle(   fontSize: 15, fontWeight: FontWeight.bold )),),
                SizedBox(height : 20 ),

                Row(
                    children:[
                      Text("Office ", textAlign: TextAlign.left, style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700, fontSize: 20)),
                      SizedBox(width: 10),
                      Icon(Icons.business, color: Colors.green),
                    ]
                ),
                SizedBox(height : 15 ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(" Boxaload \n AG Weidenweg 154310 \nRheinfelden ", style: TextStyle(   fontSize: 15, fontWeight: FontWeight.bold )),),
                SizedBox(height : 20 ),


              ])
          )
      )
    );
  }
}
