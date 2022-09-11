import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_animarker/flutter_map_marker_animation.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'dart:async';

class DepositMap extends StatefulWidget {
  double lat;
  double lng;
  DepositMap(this.lat,this.lng);

  @override
  _DepositMapState createState() => _DepositMapState();
}

class _DepositMapState extends State<DepositMap> {

  Map<MarkerId,Marker> _markers = <MarkerId,Marker>{};
  List<Polyline> _polyline = [];


  User user = FirebaseAuth.instance.currentUser;

  PanelController _pc = PanelController();
  final mapcontroller = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').where('deposit',isEqualTo: true).snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
          if(!snapshot.hasData){
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).primaryColor,
                  title: Text("Cash deposit",
                  ),
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                body: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasData) {
            snapshot.data.docs.forEach((element) {
              var mar = element['name'];
              MarkerId markerId = MarkerId(mar);
              _markers[markerId] = RippleMarker(
                  onTap: (){

                    //Navigator.push(context, MaterialPageRoute(builder: (context) => RiderImage2(element['id']) ));


                  },
                  //icon: myIcon!,
                  ripple: false,
                  markerId: markerId,
                  position: LatLng(
                    element['coords'].latitude,
                    element['coords'].longitude,
                  ),
                  infoWindow: InfoWindow(
                    title: element['name'],
                  )
              );
            });

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                title: Text("Cash deposit",
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              body: Container(
                  child: Stack(
                    children: [
                      Animarker(
                        mapId: mapcontroller.future.then((value) => value.mapId),
                        markers: Set<Marker>.of(_markers.values),
                        child: GoogleMap(
                          onMapCreated: ( controller) => mapcontroller.complete(controller),
                          initialCameraPosition: CameraPosition(
                              target: LatLng(widget.lat, widget.lng),
                              zoom: 21.0
                          ),
                          mapType: MapType.normal,
                        ),
                      ),
                    ],
                  )
              ),
            );
          }
          return CircularProgressIndicator();
        }
    );
  }
}
