import 'package:box_aload/AfterLoginScreens/riders/campaignlist.dart';
import 'package:box_aload/AfterLoginScreens/riders/faq.dart';
import 'package:box_aload/AfterLoginScreens/riders/getriderdata.dart';
import 'package:box_aload/Components/dark.dart';
import 'package:flutter/material.dart';
import 'package:box_aload/services/Auth.dart';
import 'package:box_aload/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:box_aload/Components/loading.dart';
import 'package:box_aload/AfterLoginScreens/riders/campaign.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
class RidersHome extends StatefulWidget {
  @override
  _RidersHomeState createState() => _RidersHomeState();
}

class _RidersHomeState extends State<RidersHome> {

  String qrCode = 'Unknown';

  String? error;

  final AuthService _auth = AuthService();

  Future<void> scanQrCode() async {

    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#00FF00', "Cancel", true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });

    } on PlatformException{
      qrCode = "Failed to get platform version";
    }


  }

  @override
  Widget build(BuildContext context) {

    User user = FirebaseAuth.instance.currentUser!;

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc(user.uid).snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot ) {
          if (snapshot.hasError){
            return Text("Error: ${snapshot.error}");
          }
          else if (snapshot.hasData){
            return Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(60.0),
                  child: AppBar(
                    backgroundColor: Theme.of(context).primaryColor,
                    elevation: 10.0,
                    leading: Builder(builder: (context) => // Ensure Scaffold is in context
                    IconButton(
                        icon: Icon(Icons.menu,
                        ),
                        onPressed: () => Scaffold.of(context).openDrawer()
                    )),
                    title: Image.asset("assets/Logo.png",
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
                           //home
                            Container(
                              child: ListTile(
                                onTap: ()  {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RidersHome() ));
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
                            //campaign
                            Container(
                              child: ListTile(
                                onTap: () async {

                                  if(snapshot.data!['verify']=='yes'){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => CampaignList()));
                                  }
                                  else {
                                    final snackBar = SnackBar(content: Text(" Complete your profile "));
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                  }







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
                            //My profile
                            Container(
                              child: ListTile(
                                onTap: ()  {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => GetRiderData() ));
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

                            //FAQ
                            Container(
                              child: ListTile(
                                onTap: ()  {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Faq() ));
                                },
                                leading:
                                Icon(Icons.question_answer, size: 20.0,color: Colors.green,),
                                title: Text("FAQ",
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

                            //logout
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
                body: Container (
                  child: Center(
                    child: TextButton(
                      onPressed: () async  {
                        if(snapshot.data!['verifypic'] == 'yes'){
                          if(kIsWeb){
                             Navigator.push(context, MaterialPageRoute(
                                 builder: (context) => Campaign()));
                           //showTopSnackBar(context, CustomSnackBar.error(message: " Use Android or IOS App ! "));
                          }
                          else {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Campaign()));
                            // scanQrCode();
                            // if (qrCode == snapshot.data!['campaign id']) {
                            //   Navigator.push(context, MaterialPageRoute(
                            //       builder: (context) => Campaign()));
                            // }
                            // else {
                            //   showTopSnackBar(context, CustomSnackBar.error(message: " Invalid QR ! "));
                            // }
                          }
                        }
                        else {
                          showTopSnackBar(context, CustomSnackBar.info(message:" Choose a campaign and participate"));
                        }
                      },
                      child: Container(
                        height: 40.0,
                        width: 200,
                        padding: EdgeInsets.symmetric(horizontal: 15.0,),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8.0),),
                        child: Center(
                          child: Text("Scan QR",
                            style: TextStyle(
                              color:  Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                            ),),
                        ),),
                    ),
                  ),

                ),

            );

          }
          return Loading();
        }
    );


  }

}


