import 'package:cashtroopsdemo/Services/DatabaseService.dart';
import 'package:location/location.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:geodesy/geodesy.dart';
class LocationService {
  final String uid;
  LocationService({ this.uid });
  LocationData track ;
  Geodesy geodesy = Geodesy();

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

        track = await location.getLocation();
          await DatabaseService(uid: uid).updateLocation(track.latitude, track.longitude);
        //location.enableBackgroundMode(enable: true);
        print("succes1");
      }
    }
  }

   getDistance(double l1 , double l2 , double l3 , double l4) async {
    num distance = geodesy.distanceBetweenTwoGeoPoints(LatLng(l1,l2), LatLng(l3,l4));
      num km = 0.0;
      km = distance/1000;
      return km;
  }

}