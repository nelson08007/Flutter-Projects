import 'dart:async';
import 'package:box_aload/AfterLoginScreens/advertisers/riderimage.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:box_aload/Components/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_animarker/flutter_map_marker_animation.dart';
import 'package:box_aload/services/storage.dart';
import 'package:box_aload/AfterLoginScreens/advertisers/imagepage.dart';

class MapAndroid extends StatefulWidget {

  @override
  _MapAndroidState createState() => _MapAndroidState();
}

class _MapAndroidState extends State<MapAndroid> {
 Map<MarkerId,Marker> _markers = <MarkerId,Marker>{};
 List<Polyline> _polyline = [];


 User? user = FirebaseAuth.instance.currentUser;

PanelController _pc = PanelController();
final mapcontroller = Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('markers').where('campaign id',isEqualTo: user!.uid).snapshots(),
      builder:
      (BuildContext context, AsyncSnapshot<QuerySnapshot>snapshot){
        if(!snapshot.hasData){
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).primaryColor,
                title: Text("Track your Ad",
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
              body: Loading()
          );
        }
    if(snapshot.hasData) {
      snapshot.data!.docs.forEach((element) {
        var mar = element['id'];
        MarkerId markerId = MarkerId(mar);
        _markers[markerId] = RippleMarker(
          onTap: (){

            Navigator.push(context, MaterialPageRoute(builder: (context) => RiderImage2(element['id']) ));


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
        PolylineId polylineId = PolylineId(mar);
        List<LatLng> latlng = [];
        for(int i=0;i < element['polyline'].length; i++){
          latlng.add(
            LatLng(
              element['polyline'][i].latitude ,
              element['polyline'][i].longitude,
            ),
          );
        }
        _polyline.add( Polyline(
          polylineId: polylineId,
           points: latlng,
          color: Colors.green,
        ));

      });

      return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Track your Ad",

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
                   polylines: _polyline.toSet(),
                    onMapCreated: ( controller) => mapcontroller.complete(controller),
                    initialCameraPosition: CameraPosition(
                        target: LatLng(59.3293, 18.0686),
                        zoom: 14.0
                    ),
                    mapType: MapType.normal,

                  ),
                ),
              ],
          )
          ),
        );

    }
        return Loading();
        }
    );

  }

 Widget buildFile(BuildContext context, FirebaseFile file) => ListTile(
   leading: ClipOval(
     child: Image.network(
       file.url,
       width: 52,
       height: 52,
       fit: BoxFit.cover,
     ),
   ),
   title: Text(
     file.name,
     style: TextStyle(
       fontWeight: FontWeight.bold,
       decoration: TextDecoration.underline,
       color: Colors.blue,
     ),
   ),
   onTap: () => Navigator.of(context).push(MaterialPageRoute(
     builder: (context) => ImagePage(file: file),
   )),
 );

 Widget buildHeader(int length) => ListTile(
   tileColor: Colors.green,
   leading: Container(
     width: 52,
     height: 52,
     child: Icon(
       Icons.file_copy,
       color: Colors.white,
     ),
   ),
   title: Text(
     '$length Files',
     style: TextStyle(
       fontWeight: FontWeight.bold,
       fontSize: 20,
       color: Colors.white,
     ),
   ),
 );

}