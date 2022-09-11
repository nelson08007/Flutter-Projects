import 'package:box_aload/Components/dark.dart';
import 'package:flutter/material.dart';
import 'package:box_aload/Components/Carousel.dart';
import 'package:box_aload/Authentication/Signin.dart';
import 'package:box_aload/DesktopScreens/Contactdes.dart';
import 'package:box_aload/DesktopScreens/Homedes.dart';
import 'package:box_aload/DesktopScreens/Ridersdes.dart';
import 'package:box_aload/DesktopScreens/Teamdes.dart';
class Addes extends StatefulWidget {
  @override
  _AddesState createState() => _AddesState();
}

class _AddesState extends State<Addes> {
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
                  icon: Icon(Icons.menu, ),
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
            color: Colors.white,
              ),
            )
        ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 30),
        child: SingleChildScrollView(
            child: Column(
                children: [
                  Carousel(),
                  SizedBox(height:10.0),
                  Row(
                  children: [
                    Image.asset("assets/Cycle I.jpg",
                      width: 400.0,
                      height: 400.0,
                    ),
                    SizedBox(width: 30),
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text("We get your campaign going ", style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.w700,
                              fontSize: 30)),
                          SizedBox(
                            height: 20,
                          ),
                          Text("With our advertising boxes you can reach every corner of the city. Whether in the park, at the train station, in front of universities, on the bridge or at a red traffic light, our advertising boxes are wherever your target group is. Through our dense advertising network, we generate the reach you need. ", style: TextStyle(
                                fontSize: 25)),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text("Your advertising attracts attention  ",
                                style: TextStyle(color: Colors.green,
                                    fontWeight: FontWeight.w700, fontSize: 30)),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Mobile outdoor advertising is the medium with the fastest reach. Current surveys show that our innovative advertising medium is met with great sympathy and recognition. ", style: TextStyle(
                                  fontSize: 25)),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                      SizedBox(width: 30),
                      Image.asset("assets/Cycle II.jpg",
                        width: 400.0,
                        height: 400.0,
                      ),
                    ],
                  ),
                  SizedBox(height: 40),

                  Row(
                    children: [
                      Image.asset("assets/Cycle III.jpg",
                        width: 400.0,
                        height: 400.0,
                      ),
                      SizedBox(width: 30),
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text("Get insights into your reach",
                                style: TextStyle(color: Colors.green,
                                    fontWeight: FontWeight.w700, fontSize: 30)),
                            SizedBox(
                              height: 20,
                            ),
                            Text("The movements as well as locations and downtimes of the advertising boxes are measured live with our app and evaluated for you. ", style: TextStyle(
                                  fontSize: 25)),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text("We bring your advertising to people  ",
                                style: TextStyle(color: Colors.green,
                                    fontWeight: FontWeight.w700, fontSize: 30)),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Our advertising ambassadors are out and about in your desired region every day. They also move where you can't get with classic posters. ", style: TextStyle(
                                  fontSize: 25)),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                      SizedBox(width: 30),
                      Image.asset("assets/Cycle IV.jpg",
                        width: 400.0,
                        height: 400.0,
                      ),
                    ],
                  ),
                  SizedBox(height: 40),

                  Row(
                    children: [
                      Image.asset("assets/Cycle V.jpg",
                        width: 400.0,
                        height: 400.0,
                      ),
                      SizedBox(width: 30),
                      Expanded(
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Text(" Prices & data delivery ",
                                textAlign: TextAlign.left, style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w700, fontSize: 30)),
                            SizedBox(height: 20,),
                            Text("Download our current prices and information on data delivery. You can find more information after registering without obligation on our website. ",
                                style: TextStyle( 
                                    fontSize: 25)),
                            SizedBox(height: 20),
                            Text(" Prices & conditions ", textAlign: TextAlign.left, style: TextStyle(color: Colors.blue,
                                fontWeight: FontWeight.w700, fontSize: 18)),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: Text("Download the app for your device here ",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w700, fontSize: 30)),
                  ),
                  SizedBox(height: 20),

                  Center(
                      child: Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          height: 80,
                          width: 250,
                          decoration: BoxDecoration(
                             
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Row(children: [
                            Image.asset("assets/Google.png"),
                            SizedBox(width: 10.0),
                            Center(
                                child: Column(children: [
                                  Text(" Download On", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20.0)),
                                  SizedBox(height: 5.0),
                                  Text(" Playstore", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 25.0))
                                ]))
                          ]))),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                      child: Container(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                          height: 80,
                          width: 250,
                          decoration: BoxDecoration(
                             
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Row(children: [
                            Image.asset("assets/Apple.png"),
                            SizedBox(width: 10.0),
                            Center(
                                child: Column(children: [
                                  Text(" Download On", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20.0)),
                                  SizedBox(height: 5.0),
                                  Text(" Appstore", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 25.0))
                                ]))
                          ]))),
                  SizedBox(height: 20),


                ]
            )
        ),
      )
    );
  }
}
