import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:box_aload/Components/loading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:box_aload/services/DatabaseService.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:geodesy/geodesy.dart';
import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:box_aload/services/storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
class Campaign extends StatefulWidget {

  @override
  _CampaignState createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {
  User user = FirebaseAuth.instance.currentUser!;
  Geodesy geodesy = Geodesy();
  LocationData? currentlocation ;
  LocationData? initiallocation ;
  LocationData? finallocation ;
  num KM = 0.0;
  num dis = 0.0;

  UploadTask? task1;
  File? file1;
  var url1;
  Uint8List? u1;
  String? a1 = " ";
  Future selectweb1() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) {
      print("no files picked");
      return;
    }
    Uint8List? uploadfile = result.files.single.bytes;
    String Filename = basename(result.files.single.name );

    setState(() {
      u1 = uploadfile;
      a1 = Filename;
    });

  }

  Future uploadweb1() async {
    if (u1 == null) return;

    final fileName = a1;
    final destination = 'Rider uploads/' + user.uid + '/$fileName';

    task1 = Firebaseapi.uploadBytes(destination, u1 ?? Uint8List.fromList([]));
    setState(() {});

    if (task1 == null) return;

    final snapshot = await task1!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      url1 = urlDownload;
    });

  }

  Future selectFile1() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) {
      print("no files picked");
      return;
    }
    final path = result.files.single.path;

    setState(() => file1 = File(path!));
  }

  Future uploadFile1() async {
    if (file1 == null) return;

    final fileName = basename(file1!.path);
    final destination = 'Rider uploads/' + user.uid + '/$fileName';

    task1 = Firebaseapi.uploadFile(destination, file1!);
    setState(() {});

    if (task1 == null) return;

    final snapshot = await task1!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      url1 = urlDownload;
    });

  }

 getlocation() async {
  if (kIsWeb) {
    Location location = Location();
    PermissionStatus? _permissionGranted;
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      print("permission problem1");
    }

    if (_permissionGranted == PermissionStatus.granted) {
      print("success");

      location.onLocationChanged.listen(
              (LocationData event) async {
            setState(() {
              currentlocation = event;
            });
            await DatabaseService(uid: user.uid).updatemarker(
                currentlocation!.latitude  , currentlocation!.longitude);
            print("update marker success");
          });
      //location.enableBackgroundMode(enable: true);

      print("succes1");
    }
  }
  else{
    Location location = Location();
    bool? _serviceEnabled;
    PermissionStatus? _permissionGranted;
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

      location.onLocationChanged.listen((LocationData event) async {
        setState(() {
          currentlocation = event;
        });
        await DatabaseService(uid: user.uid).updatemarker(
            currentlocation!.latitude  , currentlocation!.longitude );
        print("update marker success");
      });
 
      //location.enableBackgroundMode(enable: true);
      print("succes1");
    }
  }
}

getDistance(double l1 , double l2 , double l3 , double l4) async {
  num distance = geodesy.distanceBetweenTwoGeoPoints(LatLng(l1,l2), LatLng(l3,l4));
  setState(() {
    KM = distance/1000;
    print("getdistance setstate success");
    print(KM);
  });
  print("get distance success");
  await DatabaseService(uid: user.uid).adddistance(KM);
}

getini () async {
  Future.delayed(const Duration(milliseconds: 3000), () async {
    setState(() {
      initiallocation = currentlocation;
      print("getini setsate success");
    });
    print("getini sucess");
  });
}

  @override
  void initState()  {
    super.initState();
    getlocation();
    getini();
    print("all function called on initstae");
}

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc(user.uid).snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot ) {
          if (snapshot.hasError){
            return Text("Error: ${snapshot.error}");
          }
          else if (snapshot.hasData){
            return WillPopScope(
              onWillPop: () async => false,
              child: Scaffold(
                body: Container(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height:30),
                        CircularPercentIndicator(
                          animation:true,
                          animationDuration: 10,
                          circularStrokeCap: CircularStrokeCap.round,
                          radius: 200,
                          lineWidth: 20.0,
                          percent: snapshot.data!['km'] > 10 ? 1.0 : snapshot.data!['km'] / 10,
                          center: Text("Distance Travelled",  style:  TextStyle(
                              fontWeight: FontWeight.w700,
                          ),),
                          progressColor: Colors.green,
                        ),
                        SizedBox(height: 30),
                        Center(
                          child: Text(snapshot.data!['km'].toStringAsFixed(3) + " KM",
                            style:  TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 30
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () async {
                            showTopSnackBar(context, CustomSnackBar.info(message: "Please wait for 3 seconds"));
                            Future.delayed(const Duration(milliseconds: 3000), () async {
                              finallocation = currentlocation;
                              getDistance(
                                  initiallocation!.latitude ?? 0.0,
                                  initiallocation!.longitude  ?? 0.0,
                                  finallocation!.latitude ?? 0.0,
                                  finallocation!.longitude ?? 0.0
                              );
                            //  await DatabaseService(uid: user.uid).adddistance(KM);

                              List dis = List.from(snapshot.data!['distance']);
                              num sum = 0;
                              for (int i =0 ; i< dis.length; i++){
                                sum += dis[i];

                                print("$i -- $sum");
                              }

                              // dis.forEach((element) {
                              //   sum += element;
                              //   print(sum);
                              // });
                              // var sum = 0;
                              // sum = snapshot.data!['distance'].fold(0, (previous, current) => previous + current);
                              await DatabaseService(uid: user.uid).addkm(sum);
                              Navigator.pop(context);

                              showTopSnackBar(context, CustomSnackBar.error(message: " Tracking Stopped  "));

                            });
                          },
                       child: Container(
                          height: 80,
                          width: 200.0,
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),),
                            color: Colors.red,
                          ),
                          child: Center(
                            child: Text("Stop Tracking",
                              style:  TextStyle(
                                  color:Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20
                              ),
                            ),
                          ),
                        ),
                        ),
                        SizedBox(height: 50),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  if (kIsWeb) {
                                    selectweb1();
                                  }
                                  else {
                                    selectFile1();
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),),
                                    color: Colors.green,
                                  ),
                                  child: Center(
                                    child: Text("Select image",
                                      style:  TextStyle(
                                          color:Colors.black,
                                          fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  if (kIsWeb) {
                                    uploadweb1();
                                    showTopSnackBar(context, CustomSnackBar.success(message: " Upload success !"));
                                  }
                                  else {
                                    uploadFile1();
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: 150.0,
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),),
                                    color: Colors.green,
                                  ),
                                  child: Center(
                                    child: Text("Upload",
                                      style:  TextStyle(
                                          color:Colors.black,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                        ),
                        SizedBox(height: 20),
                        if(currentlocation == null) Text("Refreshing..."),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Loading();
        }
    );
  }
}








