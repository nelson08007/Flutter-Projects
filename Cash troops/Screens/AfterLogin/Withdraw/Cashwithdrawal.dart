
import 'package:cashtroopsdemo/Services/LocationService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CashWithdraw extends StatefulWidget {
  double lat;
  double lng;
  CashWithdraw(this.lat,this.lng);
  @override
  _CashWithdrawState createState() => _CashWithdrawState();
}

class _CashWithdrawState extends State<CashWithdraw> {

  Future<Null> refreshList() async {
    await Future.delayed(Duration(seconds: 2));
  }
  User user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cash Withdrawal"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('users').where('withdraw',isEqualTo: true).snapshots(),
          builder: (BuildContext context , AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            // Text((document.data() as dynamic)['title'],
            if (snapshot.hasData) {

              return RefreshIndicator(
                onRefresh: refreshList,
                child: ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                    return  Card(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => CampaignList1(document['uid']) ));
                        },
                        leading:CircleAvatar(
                          child: Image.asset(
                            "Assets/virat.jpg",
                          ),
                          backgroundColor: Theme.of(context).primaryColor,
                          radius: 25.0,
                        ),
                        title: Text( document['name'],
                          style: TextStyle(
                              fontWeight: FontWeight.w700
                          ),),
                        subtitle: Text( '${num.parse(
                            LocationService(uid: user.uid).getDistance(
                                document['coords'].langitude,
                                document['coords'].longitude,
                                widget.lat,
                                widget.lng
                            )
                        )}',
                          style: TextStyle(color: Colors.grey,
                            //fontWeight: FontWeight.w700,
                          ),),
                        trailing: TextButton(
                          onPressed: (){},
                          child: Text("View in map"),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
