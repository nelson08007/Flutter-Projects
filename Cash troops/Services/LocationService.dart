import 'package:cashtroopsdemo/Services/DatabaseService.dart';
import 'package:location/location.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:latlong/latlong.dart';

class LocationService {
  final String uid;
  LocationService({ this.uid });
  LocationData track ;

  final Distance distance = new Distance();

  getlocation() async {
    if (kIsWeb) {
      Location location = Location();
      PermissionStatus _permissionGranted;
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        print("permission problem");
      }

      if (_permissionGranted == PermissionStatus.granted) {
        location.onLocationChanged.listen(
                (LocationData event) async {
                  track = event;
                  await DatabaseService(uid: uid).updateLocation(track.latitude, track.longitude);

            });

        track = await location.getLocation();
        await DatabaseService(uid: uid).updateLocation(track.latitude, track.longitude);


      }
    }
    else{
      Location location = Location();
      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        print("service problem1");
      }
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        print("permission problem1");
      }

      if (_permissionGranted == PermissionStatus.granted) {
        print("succes");
        if (_permissionGranted == PermissionStatus.granted) {
          location.onLocationChanged.listen(
                  (LocationData event) async {
                track = event;
                await DatabaseService(uid: uid).updateLocation(track.latitude, track.longitude);
              });

          track = await location.getLocation();
          await DatabaseService(uid: uid).updateLocation(track.latitude, track.longitude);


        }

        //location.enableBackgroundMode(enable: true);
        print("succes1");
      }
    }
  }

   String getDistance(double l1 , double l2 , double l3 , double l4)  {
     final int meter = distance(
         new LatLng(l1,l2),
         new LatLng(l3,l4)
     );

      return meter.toString();
  }

}