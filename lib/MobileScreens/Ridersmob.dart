import 'package:box_aload/Components/Carousel.dart';
import 'package:box_aload/Components/dark.dart';
import 'package:flutter/material.dart';
import 'package:box_aload/Authentication/Signin.dart';
import 'package:box_aload/MobileScreens/Homemob.dart';
import 'package:box_aload/MobileScreens/Contactmob.dart';
import 'package:box_aload/MobileScreens/Teammob.dart';
import 'package:box_aload/MobileScreens/Advertisermob.dart';
class Ridersmob extends StatefulWidget {
  @override
  _RidersmobState createState() => _RidersmobState();
}

class _RidersmobState extends State<Ridersmob> {

  
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
              Carousel(),
              SizedBox(
                height: 20,
              ),
              Text("Register as a cyclist ", textAlign: TextAlign.left, style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700, fontSize: 20)),
              SizedBox(
                height: 20,
              ),
              Text("Do you cycle three or more days and ride at least ten kilometers a wee? if so, then create a complete profile , become a member of our community like thousand of other cycling enthusiasts across Switzerland and earn CHF 20.00 per week with your journey ", style: TextStyle(   fontSize: 15)),
              SizedBox(height: 20),
              Center(child: Image.asset("assets/Cycle I.jpg")),
              SizedBox(height: 40),



              Text("Choose your first campaign ", textAlign: TextAlign.left, style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700, fontSize: 20)),
              SizedBox(height: 20),
              Text("Decide on the campaign of your choice. We will mount the personal advertising box on your bike on the start day of your first campaign. With the personal advertising box on your luggage rack, you are equipped for all other campaigns. ", style: TextStyle(   fontSize: 15)),
              SizedBox(height: 20),
              Center(child: Image.asset("assets/Cycle II.jpg")),
              SizedBox(height: 40),
              Text("Select campaign - cycling - earn money ", textAlign: TextAlign.left, style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700, fontSize: 20)),
              SizedBox(height: 20),
              Text("With your personal advertising box you get access to all campaigns in your city. After successfully installing the app and the advertising box, you will receive the advertising film directly to your home and be ready to go again within less than five minutes! ", style: TextStyle(   fontSize: 15)),
              SizedBox(height: 20),
              Center(child: Image.asset("assets/Cycle III.jpg")),
              SizedBox(height: 40),
              Text("Download our app on your smartphone for free ", style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700, fontSize: 20)),
              SizedBox(
                height: 20,
              ),
              Text("You need an Smartphone with an Android 4.4 or IOS 11 or any later version of either operating system to participate. Download the app for your device below", style: TextStyle(   fontSize: 15)),
              SizedBox(height: 20),
              Center(child: Image.asset("assets/Cycle IV.jpg")),
              SizedBox(height: 40),
              Text("Download the app for your device here ", style: TextStyle(color: Colors.green, fontWeight: FontWeight.w700, fontSize: 20)),
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
              SizedBox(height: 40),
            ])),
      )
    );
  }
}
