import 'package:box_aload/AfterLoginScreens/riders/campaignlist1.dart';
import 'package:box_aload/AfterLoginScreens/riders/getriderdata.dart';
import 'package:box_aload/Components/loading.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:slimy_card/slimy_card.dart';
class Faq extends StatefulWidget {


  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(" FAQ",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
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
          stream: FirebaseFirestore.instance.collection('faq').snapshots(),
          builder: (BuildContext context , AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return Loading();
            }
            // Text((document.data() as dynamic)['title'],
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  return  Column(
                    children: [
                      SizedBox(height: 10,),
                      SlimyCard(
                        color: Colors.green,
                        width: 400,
                        topCardHeight: 100,
                        bottomCardHeight: 100,
                        borderRadius: 15,
                        slimeEnabled: true,
                        topCardWidget: Center(
                          child: Text(document['Q'],
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 20
                            ),


                          ),
                        ),
                        bottomCardWidget: Center(
                          child: Text(document['A'],
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.w700,
                                fontSize: 20
                            ),


                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  );
                }).toList(),
              );
            }
            return Loading();
          },
        ),
      ),


    );
  }
}




