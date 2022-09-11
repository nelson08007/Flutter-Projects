import 'package:flutter/material.dart';
import 'package:box_aload/Components/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminView2 extends StatefulWidget {
  String? uid;


  AdminView2(this.uid,);

  @override
  _AdminView2State createState() => _AdminView2State();
}

class _AdminView2State extends State<AdminView2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Advertiser details",
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,

          ),
          onPressed: (){
            Navigator.pop(context);
          },

        ),
      ),
      body:  StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').doc(widget.uid).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot ) {
            if (snapshot.hasError){
              return Text("Error: ${snapshot.error}");
            }
            else if (snapshot.hasData){
              return Container(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [


                      SizedBox(height:20),
                      //firstname
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("First Name",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(height:20),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(snapshot.data!['first name'],
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(height:30),
                      //last name
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Last Name",
                            style: TextStyle(

                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(height:20),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(snapshot.data!['last name'],
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(height:30),

                      //company
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Company Name",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(height:20),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(  snapshot.data!['company'],
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(height:30),

                      //phone
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Phone number",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(height:20),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(snapshot.data!['phone number'],
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(height:30),
                     //email
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Email Address",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(height:20),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(snapshot.data!['email'],
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(height:30),

                       //Address
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Address",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(height:20),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(snapshot.data!['address'],
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(height:30),

                      //city
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("City",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(height:20),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(snapshot.data!['city'],
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(height:30),

                      //zipcode
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Zipcode",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(height:20),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(snapshot.data!['zipcode'],
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(height:30),
                    ],

                  ),
                ),


              );
            }
            return Center(child: Loading(),);



          }

      ),


    );
  }
}
