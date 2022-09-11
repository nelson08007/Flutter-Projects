

import 'package:box_aload/AfterLoginScreens/advertisers/advertiserhome.dart';
import 'package:box_aload/AfterLoginScreens/riders/riderhome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:box_aload/Components/loading.dart';
import 'package:box_aload/AfterLoginScreens/admin/AdminHome.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Wrapper2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body:

      StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection('users').doc(user.uid).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot ) {
            if (snapshot.hasError){
              return Text("Error: ${snapshot.error}");
            }

            else if (snapshot.hasData){
                    if(snapshot.data!['role']=='admin'){
                       return AdminHome();
                         }
                            else if(snapshot.data!['role']=='rider'){
                                 return RidersHome();
                                      }
                                else if(snapshot.data!['role']=='advertiser'){
                                      return AdvertiserHome();
              }
            }
            return Center(child: Loading(),);
          }
      ),
    );
  }
}
