
import 'package:box_aload/AfterLoginScreens/advertisers/view2.dart';
import 'package:box_aload/Components/dark.dart';
import 'package:box_aload/Components/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:box_aload/AfterLoginScreens/advertisers/getadvertiserdata.dart';
import 'package:box_aload/services/Auth.dart';
import 'package:box_aload/main.dart';
import 'package:box_aload/AfterLoginScreens/advertisers/advertiserhome.dart';
class CampaignView extends StatefulWidget {


  @override
  _CampaignViewState createState() => _CampaignViewState();
}

class _CampaignViewState extends State<CampaignView> {

  String? error;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('campaign').doc(user.uid).snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot ) {
          if (snapshot.hasError){
            return Text("Error: ${snapshot.error}");
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Loading();
          }
          if(snapshot.hasData && !snapshot.data!.exists)
          {
            return Center(child: Text("No campaign available for now"));
          }
          else if (snapshot.hasData){
            if(snapshot.data!['set']=='no'){
              return Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(60.0),
                  child: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 10.0,
                    leading: Builder(builder: (context) => // Ensure Scaffold is in context
                    IconButton(
                        icon: Icon(Icons.menu,color: Colors.black,),
                        onPressed: () => Scaffold.of(context).openDrawer()
                    )),
                    title:   Center(
                      child: Image.asset("assets/Logo.png",
                        width: 80.0,
                        height: 65.0,
                      ),
                    ),
                  ),
                ),
                drawer: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)
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
                                onTap: ()  {

                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AdvertiserHome() ));

                                },
                                leading:
                                Icon(Icons.home, size: 20.0,color: Colors.green,),
                                title: Text("Home",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),),
                                dense: true,
                                // padding: EdgeInsets.zero,
                              ),
                            ),
                            Container(
                              child: ListTile(
                                onTap: ()  {

                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CampaignView() ));

                                },
                                leading:
                                Icon(Icons.campaign, size: 20.0,color: Colors.green,),
                                title: Text("Campaign",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),),
                                dense: true,
                                // padding: EdgeInsets.zero,
                              ),
                            ),
                            Container(
                              child: ListTile(
                                onTap: ()  {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => GetAdvertiserData() ));
                                },
                                leading:
                                Icon(Icons.person, size: 20.0,color: Colors.green,),
                                title: Text("My Profile",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),),
                                dense: true,
                                // padding: EdgeInsets.zero,
                              ),
                            ),
                            //darkmode
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
                              child: ListTile(
                                onTap: () async {
                                  error =await _auth.signOut();
                                  final snackBar = SnackBar(content: Text(error!));
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  if(error=='Signed Out'){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage() ));
                                  }
                                },
                                leading:
                                Icon(Icons.logout, size: 20.0,color: Colors.green,),
                                title: Text("Log out",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),),
                                dense: true,
                                // padding: EdgeInsets.zero,
                              ),
                            ),
                            Container(height: 400,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                body: Container(
                  child: Center(
                    child: Text("You have no active  campaign",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ),
              );
            }
            else if(snapshot.data!['set']=='yes'){
              return Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(60.0),
                  child: AppBar(
                    backgroundColor: Theme.of(context).primaryColor,
                    elevation: 10.0,
                    leading: Builder(builder: (context) => // Ensure Scaffold is in context
                    IconButton(
                        icon: Icon(Icons.menu,),
                        onPressed: () => Scaffold.of(context).openDrawer()
                    )),
                    title:   Image.asset("assets/Logo.png",
                      width: 80.0,
                      height: 65.0,
                    ),
                  ),
                ),
                drawer: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50)
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
                                onTap: ()  {

                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AdvertiserHome() ));

                                },
                                leading:
                                Icon(Icons.home, size: 20.0,color: Colors.green,),
                                title: Text("Home",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),),
                                dense: true,
                                // padding: EdgeInsets.zero,
                              ),
                            ),
                            Container(
                              child: ListTile(
                                onTap: ()  {

                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CampaignView() ));

                                },
                                leading:
                                Icon(Icons.campaign, size: 20.0,color: Colors.green,),
                                title: Text("Campaign",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),),
                                dense: true,
                                // padding: EdgeInsets.zero,
                              ),
                            ),
                            Container(
                              child: ListTile(
                                onTap: ()  {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => GetAdvertiserData() ));
                                },
                                leading:
                                Icon(Icons.person, size: 20.0,color: Colors.green,),
                                title: Text("My Profile",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),),
                                dense: true,
                                // padding: EdgeInsets.zero,
                              ),
                            ),
                            Container(
                              child: ListTile(
                                onTap: () async {
                                  error =await _auth.signOut();
                                  final snackBar = SnackBar(content: Text(error!));
                                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  if(error=='Signed Out'){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage() ));
                                  }
                                },
                                leading:
                                Icon(Icons.logout, size: 20.0,color: Colors.green,),
                                title: Text("Log out",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),),
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
                  child: Column(
                    children: [
                      SizedBox(height:20),
                      Card(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading:CircleAvatar(
                            child: Image.asset(
                              "assets/horn.png",
                            ),
                            backgroundColor: Theme.of(context).primaryColor,
                            radius: 25.0,
                          ),
                          title: Text( snapshot.data!['title'] ,
                            style: TextStyle(
                                fontWeight: FontWeight.w700
                            ),),
                          subtitle: Text( snapshot.data!['description'],
                            style: TextStyle(color: Colors.grey,
                                //fontWeight: FontWeight.w700,
                            ),),
                          trailing: snapshot.data!['status'] == 'pending' ?
                          Icon( Icons.pending_actions, color: Colors.grey,) :
                          Icon( Icons.check_circle, color: Colors.green,),

                          onTap: ()  {

                            Navigator.push(context, MaterialPageRoute(builder: (context) => CampaignView1() ));


                          },
                        ),
                      ),
                    ],
                  )
                ),
              );
            }
          }




          return Loading();
        }
    );









  }
}
