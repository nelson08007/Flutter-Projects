import 'package:box_aload/services/DatabaseService.dart';
import 'package:flutter/material.dart';
import 'package:box_aload/Components/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
class AdminView4 extends StatefulWidget {

  String? uid;


  AdminView4(this.uid,);

  @override
  _AdminView4State createState() => _AdminView4State();
}

class _AdminView4State extends State<AdminView4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Rider's details",
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

                      //D.o.b
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Date of birth",
                            style: TextStyle(
                               
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(height:20),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(  snapshot.data!['date of birth'],
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
                          child: Text("Street",
                            style: TextStyle(
                               
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(height:20),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(snapshot.data!['street'],
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

                      //IBAN
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("IBAN number",
                            style: TextStyle(
                               
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(height:20),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(snapshot.data!['IBAN number'],
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(height:30),

                      //bank name
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Bank name",
                            style: TextStyle(
                               
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(height:20),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(snapshot.data!['bank name'],
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(height:30),

                      //benificiary
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("beneficiary name",
                            style: TextStyle(
                               
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(height:20),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(snapshot.data!['beneficiary name'],
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(height:30),

                      //distance
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text("Distance travelled",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(height:20),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(snapshot.data!['km'].toString(),
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      SizedBox(height:30),

                      Center(
                        child: Text("Swipe after you sent advertising box to this rider"),
                      ),
                      SizedBox(height:30),
                      SwipeButton.expand(
                        child: Text("Swipe",
                          style: TextStyle(
                              color:Colors.black
                          )
                      ),
                        thumb: Icon(
                          Icons.double_arrow_rounded,
                          color: Colors.black,
                        ),
                        activeThumbColor: Colors.green,
                        activeTrackColor: Colors.grey.shade300,
                        onSwipe: () async {
                            await DatabaseService( uid: widget.uid ).allowupload();
                            await DatabaseService(uid: widget.uid).startmarker(
                                snapshot.data!['first name'] + snapshot.data!['last name'],
                                snapshot.data!['campaign id']
                            );
                            final snackBar = SnackBar(content: Text( " Uploading options has enabled for this rider, you will receive picture once they uploaded "));
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                      ),





                      SizedBox(height:30),
                      Center(
                        child: TextButton(
                          onPressed: () async {
                            if(snapshot.data!['pic1'] == 'no'){
                              final snackBar = SnackBar(content: Text(" Rider does not upload picture yet"));
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                            else{
                              await  launch(snapshot.data!['pic1']);

                            }

                          },
                          child: Text("Click here to download uploaded image"),
                        ),
                      ),
                      SizedBox(height:30),
                      SwipeButton.expand(
                        child: Text("Swipe to verify",
                        style: TextStyle(
                          color:Colors.black
                        )
                      ),
                        thumb: Icon(
                          Icons.double_arrow_rounded,
                          color: Colors.black,
                        ),
                        activeThumbColor: Colors.green,
                        activeTrackColor: Colors.grey.shade300,
                        onSwipe: () async {
                            await DatabaseService(uid:widget.uid).picverify();
                            showTopSnackBar(context, CustomSnackBar.success(message: "Picture verified !" ));
                        },
                      ),


                    ],

                  ),
                ),


              );
            }
            return Loading();
          }

      ),


    );
  }
}
