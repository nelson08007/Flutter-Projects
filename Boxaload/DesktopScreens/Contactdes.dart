import 'package:box_aload/Components/dark.dart';
import 'package:flutter/material.dart';
import 'package:box_aload/Authentication/Signin.dart';
import 'package:box_aload/DesktopScreens/Advertiserdes.dart';
import 'package:box_aload/DesktopScreens/Homedes.dart';
import 'package:box_aload/DesktopScreens/Ridersdes.dart';
import 'package:box_aload/DesktopScreens/Teamdes.dart';

class Contactdes extends StatefulWidget {
  @override
  _ContactdesState createState() => _ContactdesState();
}

class _ContactdesState extends State<Contactdes> {
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
          child: Row(
            children: [
              Expanded(child: Center(child: Image.asset("assets/contact.png"))),
              SizedBox(width: 50),
              Column(children: [

                SizedBox(height : 20 ),

                Expanded(
                  child: Center(

                    child: Row(
                        children:[
                          Text("Email ", style: TextStyle(
                              color: Colors.green , fontWeight: FontWeight.w700, fontSize: 35)),
                          SizedBox(width: 10),
                          Icon(Icons.email, color: Colors.green, size: 20,),
                        ]
                    ),
                  ),
                ),

                SizedBox(height : 15 ),

                Expanded(
                  child: Center(

                    child: Text(" boxaload@gmail.com ", style: TextStyle(  
                        fontSize: 25, fontWeight: FontWeight.bold )),),
                ),
                SizedBox(height : 20 ),

                Expanded(
                  child: Center(

                    child: Row(
                        children:[
                          Text("Phone ",  style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.w700, fontSize: 35)),
                          SizedBox(width: 10),
                          Icon(Icons.call , color: Colors.green, size:20),
                        ]
                    ),
                  ),
                ),
                SizedBox(height : 15 ),

                Expanded(
                  child: Center(

                    child: Text(" 123456789 ", style: TextStyle(
                           fontSize: 25, fontWeight: FontWeight.bold )),),
                ),
                SizedBox(height : 20 ),

                Expanded(
                  child: Center(

                    child: Text(" 123456789 ", style: TextStyle(
                           fontSize: 25, fontWeight: FontWeight.bold )),),
                ),
                SizedBox(height : 20 ),

                Expanded(
                  child: Center(
                    child: Row(
                        children:[
                          Text("Office ", style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.w700,
                              fontSize: 35)),
                          SizedBox(width: 10),
                          Icon(Icons.business, color: Colors.green,size:20),
                        ]
                    ),
                  ),
                ),
                SizedBox(height : 15 ),

                Expanded(
                  child: Center(
                    child: Text("Boxaload, AG Weidenweg 154310, Rheinfelden ", style: TextStyle(
                           fontSize: 25, fontWeight: FontWeight.bold )),),
                ),
                SizedBox(height : 20 ),


              ]),
            ],
          )
      )
    );
  }
}
