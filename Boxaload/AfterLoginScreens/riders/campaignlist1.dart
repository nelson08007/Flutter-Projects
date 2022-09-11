import 'package:box_aload/services/DatabaseService.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:box_aload/Components/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:box_aload/AfterLoginScreens/riders/Campaignlist2.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
class CampaignList1 extends StatefulWidget {

  String? uid;


  CampaignList1(this.uid,);

  @override
  _CampaignList1State createState() => _CampaignList1State();
}

class _CampaignList1State extends State<CampaignList1> {



  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;

    return StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection('campaign').doc(widget.uid).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot ) {
            if (snapshot.hasError){
              return Text("Error: ${snapshot.error}");
            }
            else if (snapshot.hasData){
              return Scaffold(
                floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
                floatingActionButton: FloatingActionButton.extended(
                    backgroundColor: Colors.green,
                    onPressed: () async {
                      if(int.parse(snapshot.data!['cyclist']) -snapshot.data!['no of riders'] == 0) {
                        showTopSnackBar(context, CustomSnackBar.error(message: " Sorry, No vacancy for this campaign !  "));


                      }
                      else{
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => CamapignList2(widget.uid)));
                      }
                    },


                    label: Text("Next",
                      style: TextStyle(
                          color: Colors.black
                      ),
                    )
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


                        //status and vacancy
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
                                          child: Text(" Vacancy ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)
                                          ),
                                        ),

                                        SizedBox(height:5),

                                        Center(
                                          child: Text('${int.parse(snapshot.data!['cyclist']) -snapshot.data!['no of riders']}',
                                              style: TextStyle(color: Colors.green,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 22)
                                          ),
                                        ),

                                        SizedBox(height:5),

                                      ]

                                  ),

                                  Column(
                                      children:[
                                        Center(
                                          child: Text(" Status ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)
                                          ),
                                        ),

                                        SizedBox(height:5),

                                        Center(
                                          child: Text(snapshot.data!['status'] == 'payment verified' ? "Organising stage" : "unknown",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 22)
                                          ),
                                        ),
                                        SizedBox(height:5),

                                      ]

                                  ),


                                ]
                            )


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
