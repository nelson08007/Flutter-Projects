import 'package:box_aload/AfterLoginScreens/admin/adminview4.dart';
import 'package:box_aload/Components/loading.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminView3 extends StatefulWidget {

  String? uid;


  AdminView3(this.uid,);
  @override
  _AdminView3State createState() => _AdminView3State();
}

class _AdminView3State extends State<AdminView3> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(" Registered riders",
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
      body: Container(
    child: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').where('campaign id',isEqualTo: widget.uid).snapshots(),
    builder: (BuildContext context , AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return Center(child: Text('Something went wrong'));
      }
      if(snapshot.connectionState == ConnectionState.waiting){
        return Loading();
      }
    if (snapshot.hasData) {
      return ListView(
        children: snapshot.data!.docs.map((DocumentSnapshot document) {
          return  Card(
            color: Theme.of(context).scaffoldBackgroundColor,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              onTap: (){
               Navigator.push(context, MaterialPageRoute(builder: (context) => AdminView4(document['uid']) ));
              },

              leading:CircleAvatar(
                child: Image.asset(
                  "assets/cycle.png",
                ),
                backgroundColor: Theme.of(context).primaryColor,
                radius: 25.0,
              ),
              title: Text( document['first name'] + " " + document['last name'] ,
                style: TextStyle(
                    fontWeight: FontWeight.w700
                ),),
              subtitle: Text( document['email'],
                style: TextStyle(color: Colors.grey,
                  //fontWeight: FontWeight.w700,
                ),),
            ),
          );
        }).toList(),
      );
    }
      return Loading();
    }
    ),
    ),
    );



  }
}
