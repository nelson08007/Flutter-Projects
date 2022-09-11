import 'package:box_aload/AfterLoginScreens/riders/campaignlist1.dart';
import 'package:box_aload/Components/loading.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class CampaignList extends StatefulWidget {


  @override
  _CampaignListState createState() => _CampaignListState();
}

class _CampaignListState extends State<CampaignList> {
  String? error;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(" Campaigns",
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
          stream: FirebaseFirestore.instance.collection('campaign').where('status',isEqualTo: 'payment verified').snapshots(),
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
                  return  Card(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CampaignList1(document['uid']) ));
                      },
                      leading:CircleAvatar(
                        child: Image.asset(
                          "assets/horn.png",
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                        radius: 25.0,
                      ),
                      title: Text( document['title'] ,
                        style: TextStyle(
                            fontWeight: FontWeight.w700
                        ),),
                      subtitle: Text( document['description'],
                        style: TextStyle(color: Colors.grey,
                          //fontWeight: FontWeight.w700,
                        ),),
                      trailing: document['status'] == 'pending' ?
                      Icon( Icons.pending_actions, color: Colors.grey,) :
                      Icon( Icons.check_circle, color: Colors.green,),
                    ),
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
