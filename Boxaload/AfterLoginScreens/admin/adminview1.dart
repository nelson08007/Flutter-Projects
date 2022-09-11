import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:box_aload/AfterLoginScreens/admin/adminview2.dart';
import 'package:box_aload/AfterLoginScreens/admin/adminview3.dart';
import 'package:box_aload/AfterLoginScreens/admin/qrgenerator.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:box_aload/services/DatabaseService.dart';
import 'package:box_aload/Components/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Adminview1 extends StatefulWidget {
  String? uid;


 Adminview1(this.uid,);

  @override
  _Adminview1State createState() => _Adminview1State();
}

class _Adminview1State extends State<Adminview1> {





  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection('campaign').doc(widget.uid).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot ) {
            if (snapshot.hasError){
              return Text("Error: ${snapshot.error}");
            }
            else if (snapshot.hasData){
              return Scaffold(
                floatingActionButtonLocation:
                FloatingActionButtonLocation.endFloat,
                  floatingActionButton: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height:20),
                        FloatingActionButton.extended(
                          onPressed: () async {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AdminView3(widget.uid) ));
                          },
                          icon: Icon(
                              Icons.pedal_bike,
                          ),
                          label: Text("Rider",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              )
                          ),
                        ),
                        SizedBox(height:20),
                        FloatingActionButton.extended(
                          onPressed: () async {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AdminView2(widget.uid) ));
                          },
                          icon: Icon(
                              Icons.campaign,
                          ),
                          label: Text("Advertiser",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          )
                          ),
                        ),
                        SizedBox(height:20),
                      ],
                    ),
                  ),
                  appBar: AppBar(
                    backgroundColor: Theme.of(context).primaryColor,
                    title: Text("Campaign details",
                    ),
                    leading: IconButton(
                      icon: Icon( Icons.arrow_back,),
                      onPressed: (){
                        Navigator.pop(context);
                      },

                    ),
                  ),
               body: Container(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //title and description
                        SizedBox(height:5),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("   Title & description ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25)
                          ),
                        ),
                        SizedBox(height:5),
                        Container(
                          padding: const EdgeInsets.all(20),
                          margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 20),
                          height: 180,
                          // width: 350,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                              child: Column(
                                  children:[

                                    Center(
                                      child: Text(snapshot.data!['title'],
                                          style: TextStyle(color: Colors.green,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 25)
                                      ),
                                    ),
                                    SizedBox(height:5),
                                    Divider(),
                                    SizedBox(height:10),

                                    Center(
                                      child: Text( snapshot.data!['description'],
                                          style: TextStyle(
                                            //fontWeight: FontWeight.bold,
                                              fontSize: 15)
                                      ),
                                    ),

                                  ]
                              )
                          ),
                        ),

                        //weeks and cyclist and region
                        SizedBox(height:5),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text("   Cylist & weeks ",
                              style: TextStyle(

                                  fontWeight: FontWeight.bold,
                                  fontSize: 25)
                          ),
                        ),
                        SizedBox(height:5),
                        Container(
                            padding: const EdgeInsets.all(20),
                            margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 20),
                            height: 150,
                            // width: 350,
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),

                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:[
                                  Column(
                                      children:[

                                        Center(
                                          child: Text(" Cyclist ",
                                              style: TextStyle(

                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)
                                          ),
                                        ),

                                        SizedBox(height:5),

                                        Center(
                                          child: Text(snapshot.data!['cyclist'],
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 25)
                                          ),
                                        ),

                                        SizedBox(height:5),
                                        Center(
                                          child: Text(" Region: ",
                                              style: TextStyle(

                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 25)
                                          ),
                                        ),
                                      ]

                                  ),

                                  Column(
                                      children:[
                                        Center(
                                          child: Text(" weeks ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)
                                          ),
                                        ),

                                        SizedBox(height:5),

                                        Center(
                                          child: Text(snapshot.data!['weeks'],
                                              style: TextStyle(color: Colors.green,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 25)
                                          ),
                                        ),
                                        SizedBox(height:5),
                                        Center(
                                          child: Text(snapshot.data!['city'],
                                              style: TextStyle(color: Colors.green,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 25)
                                          ),
                                        ),
                                      ]

                                  ),

                                ]
                            )


                        ),
                        SizedBox(height:10),

                        //status and riders
                        Container(
                            padding: const EdgeInsets.all(20),
                            margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 20),
                            height: 100,
                            // width: 350,
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ],
                            ),

                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:[
                                  Column(
                                      children:[
                                        Center(
                                          child: Text("Registered riders",
                                              style: TextStyle(

                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)
                                          ),
                                        ),

                                        SizedBox(height:5),

                                        Center(
                                          child: Text(snapshot.data!['no of riders'].toString(),
                                              style: TextStyle(color: Colors.green,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18)
                                          ),
                                        ),

                                        SizedBox(height:5),

                                      ]

                                  ),

                                  Column(
                                      children:[
                                        Center(
                                          child: Text("Status",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15)
                                          ),
                                        ),

                                        SizedBox(height:5),

                                        Center(
                                          child: Text(snapshot.data!['status'],
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 18)
                                          ),
                                        ),
                                        SizedBox(height:5),

                                      ]

                                  ),


                                ]
                            )


                        ),

                      //uploaded files
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text("Uploaded files",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        SizedBox(height:20),
                        Align(
                            alignment: Alignment.topLeft,
                            child: TextButton(
                              onPressed: () async {
                              await  launch(snapshot.data!['file1']);
                              },
                              child: Text( "file1"),
                            ),

                        ),
                        SizedBox(height:20),
                        Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            onPressed: () async {
                              await  launch(snapshot.data!['file2']);
                            },
                            child: Text( "file2"),
                          ),

                        ),
                        SizedBox(height:20),
                        Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            onPressed: () async {
                              await  launch(snapshot.data!['file3']);
                            },
                            child: Text( "file3"),
                          ),

                        ),
                        SizedBox(height:20),
                        Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            onPressed: () async {
                              await  launch(snapshot.data!['file4']);
                            },
                            child: Text( "file4 "),
                          ),

                        ),
                        SizedBox(height:20),
                        Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            onPressed: () async {
                              await  launch(snapshot.data!['file5']);
                            },
                            child: Text( "file5"),
                          ),

                        ),


                        //Accept
                        Center(
                          child: TextButton(
                            onPressed: () async {
                              showTopSnackBar(context, CustomSnackBar.success(message: "You have accepted this campaign successfully !"));
                              DatabaseService(uid: widget.uid).acceptcampaign();

                            },
                            child: Container(
                              height: 40.0,
                              width: 100,
                              padding: EdgeInsets.symmetric(horizontal: 15.0,),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8.0),),
                              child: Center(
                                child: Text("Accept",
                                  style: TextStyle(
                                    //fontWeight: FontWeight.w700,
                                    color:Colors.black,
                                    fontSize: 12,
                                  ),),
                              ),),
                          ),
                        ),

                        SizedBox(height:20),

                        //generate qr
                        Center(
                          child: TextButton(
                            onPressed: () async {

                              Navigator.push(context, MaterialPageRoute(builder: (context) => QrGenerator(widget.uid) ));

                            },
                            child: Container(
                              height: 40.0,
                              width: 100,
                              padding: EdgeInsets.symmetric(horizontal: 15.0,),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8.0),),
                              child: Center(
                                child: Text("Generate Qr",
                                  style: TextStyle(
                                    color:Colors.black,//fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),),
                              ),),
                          ),
                        ),

                      ],
                    ),
                  )
              ),
              );
            }
            return Loading();
          }
      );



  }
}

