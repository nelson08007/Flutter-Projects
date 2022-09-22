import 'dart:math';
import 'package:cashtroopsdemo/Screens/AfterLogin/NearbyMe/cashsend.dart';
import 'package:flutter/widgets.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NearMe extends StatefulWidget {
  double lat;
  double lng;
  NearMe(this.lat,this.lng);

  @override
  _NearMeState createState() => _NearMeState();
}

class _NearMeState extends State<NearMe> {

  User user = FirebaseAuth.instance.currentUser;
  CollectionReference person = FirebaseFirestore.instance.collection('users');

  void mapview (double l1 , double l2 , double l3 , double l4 , String name) async {
    final availableMap = await MapLauncher.installedMaps;
    //await availableMap.first.showDirections(destination: destination)
    await availableMap.first.showMarker(
        zoom: 15,
        coords: Coords(l1, l2),
        title: name);
  }

  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    return 1000 * 12742 * asin(sqrt(a));
  }

  int _value =1;

  @override
  Widget build(BuildContext context) {
    final color1 = Theme.of(context).dividerColor;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: color1,),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          title: Text("Nearby you",
            style: TextStyle(
              color: color1,
            ),
          ),
          actions: [
            Container(
              margin: EdgeInsets.fromLTRB(5, 10, 10, 10),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: color1,width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: DropdownButton(
                  icon: Icon(Icons.arrow_drop_down),
                  underline: SizedBox(),
                  //isExpanded: true,
                  items: [
                    DropdownMenuItem(child: Text("Deposit"),
                      value: 1,
                    ),
                    DropdownMenuItem(child: Text("Withdrawal"),
                      value: 2,
                    ),

                  ],
                  onChanged: (int value){
                    setState(() {
                      _value =value;
                    });
                  },
                  hint: Text("Select",
                    style: TextStyle(
                      color: color1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot>(
          stream: (_value == 1) ? person.where('deposit',isEqualTo: true)
              .where('email',isNotEqualTo: user.email).snapshots(): person.where('withdraw',isEqualTo: true)
              .where('email',isNotEqualTo: user.email).snapshots(),
          builder: (BuildContext context , AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text("no people"));
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            // Text((document.data() as dynamic)['title'],
            if (snapshot.hasData) {
              return ListView(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  double meter = 0;
                  meter = calculateDistance(
                    document['coords'].latitude,
                    document['coords'].longitude,
                    widget.lat,
                    widget.lng,
                  );
                  String km = "0";
                  String unit ="M";
                  if(meter >= 1000){
                    double i = 1;
                    i  = meter/1000;
                    km = i.toStringAsFixed(0);
                    unit = "KM";
                  }
                  else {
                    km = meter.toStringAsFixed(0);
                    unit = "M";
                  }
                  return  Card(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SendMoneyPage(
                          _value == 1 ? " Deposit to " : " Withdraw from ",
                          document['name'],
                          document['pic'],
                          document['uid'],

                        ) ));
                      },
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(document['pic']),
                      ),
                      title: Text( document['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.w700
                        ),),
                      subtitle: Text(km + " " + unit,
                        style: TextStyle(color: Colors.green,
                          //fontWeight: FontWeight.w700,
                        ),),
                      trailing: TextButton(
                        onPressed: (){
                          mapview(document['coords'].latitude, document['coords'].longitude,
                              widget.lat, widget.lng,document['name'] );
                        },
                        child: Text("View in map"),
                      ),
                    ),
                  );
                }).toList(),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),

    );
  }


}

