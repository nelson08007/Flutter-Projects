import 'package:cashtroopsdemo/Screens/AfterLogin/Account.dart';
import 'package:cashtroopsdemo/Screens/AfterLogin/NearbyMe/NearMe.dart';

import 'package:cashtroopsdemo/Services/LocationService.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shimmer_animation/shimmer_animation.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  User user = FirebaseAuth.instance.currentUser;

  @override
  void initState()  {
    super.initState();
    LocationService(uid: user.uid).getlocation();
  }

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc(user.uid).snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot ) {
          if (snapshot.hasError){
            return Text("Error: ${snapshot.error}");
          }
          else if (snapshot.hasData){
            final color = Theme.of(context).scaffoldBackgroundColor;
            return Scaffold(
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
              floatingActionButton: FloatingActionButton.extended(
                 backgroundColor: Colors.red,
                  onPressed: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Request() ));
                  },
                  icon: Icon(
                      Icons.add,
                      color: Colors.white
                  ),
                  label: Text("New Payment",
                    style: TextStyle(
                        color: Colors.white
                    ),
                  )
              ),
              body: Stack(
                children: [
                  Container(
                    height: 240,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(50)
                        )
                    ),
                  ),
                  ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.symmetric(
                          horizontal: 24.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Hi, ",
                                    style: TextStyle(
                                      color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  TextSpan(
                                    text: snapshot.data['name'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500
                                    ),
                                  ),
                                ]
                              )
                            ),
                            SizedBox(width:10),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Account();
                                    },
                                  ),
                                );
                              },
                              child: Container(
                                height:60,
                                width:60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                ),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(snapshot.data['pic'],
                                  ),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(width:24),

                              Shimmer(
                                child: Container(
                                  padding: EdgeInsets.all(20.0),
                                  height: 185,
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),

                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Your Balance :",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            //  fontWeight: FontWeight.
                                          ),
                                        ),
                                      ),
                                      SizedBox(height:20),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "\u{20B9}  "+ snapshot.data['money'],
                                          style: TextStyle(color: Colors.white, fontSize: 33, fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      SizedBox(height:20),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: ElevatedButton.icon(
                                          style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                              shape: StadiumBorder()
                                          ),
                                          icon: Icon(
                                            Icons.add,
                                            color: Colors.black,
                                          ),
                                          onPressed: () {},
                                          label: Text("Add Funds",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width:24),
                              SizedBox(width:50),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:20),
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            SizedBox(height: 20,),
                            //deposit
                            Card(
                              elevation: 10,
                              margin: EdgeInsets.only(bottom: 16),
                              color: color,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                              child: ListTile(
                                onTap: (){

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return NearMe(
                                            snapshot.data['coords'].latitude,
                                          snapshot.data['coords'].longitude,
                                        );
                                      },
                                    ),
                                  );
                                },
                                contentPadding: EdgeInsets.zero,
                                leading: Image.asset("Assets/deposit.png",
                                    height: 50
                                ),
                                title: Text("People near me",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),

                                ),
                                subtitle: Text("For deposit and withdraw ",
                                  style: TextStyle(
                                    color:Colors.grey,
                                    fontSize: 12,

                                  ),

                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text("Transaction",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),

                            ),

                            SizedBox(height: 24,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return CircularProgressIndicator();
        }
    );





  }
}
