import 'package:box_aload/Components/loading.dart';
import 'package:box_aload/services/DatabaseService.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';
import 'package:box_aload/services/storage.dart';
import 'dart:typed_data';
import 'dart:io';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

class CamapignList2 extends StatefulWidget {
  String? uid;
  CamapignList2( this.uid, );
  @override
  _CamapignList2State createState() => _CamapignList2State();
}

class _CamapignList2State extends State<CamapignList2> {

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
    final destination = 'Campaign upload/Rider upload/$fileName';

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
    final destination = 'Campaign upload/Rider upload/$fileName';

    task1 = Firebaseapi.uploadFile(destination, file1!);

    setState(() {});

    if (task1 == null) return;

    final snapshot = await task1!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      url1 = urlDownload;
    });

  }

  User user = FirebaseAuth.instance.currentUser!;

  Widget pbutton() {
return StreamBuilder<DocumentSnapshot>(
  stream:  FirebaseFirestore.instance.collection('campaign').doc(widget.uid).snapshots(),
    builder:
        (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot ) {
          if (snapshot.hasError){
            return Text("Error: ${snapshot.error}");
          }
          else if (snapshot.hasData){
             return Center(
               child: TextButton(
                 onPressed: () async {
                   AlertDialog alert = AlertDialog(
                     content: Text(
                         " Do you want to participate in this campaign "),
                     actions: [
                       ElevatedButton(onPressed: () {
                         Navigator.pop(context);
                       },
                           child: Text("Cancel",
                             style:TextStyle(
                               fontWeight: FontWeight.w700
                             )
                           )
                       ),
                       ElevatedButton(
                           onPressed: () async {

                             await DatabaseService(uid: widget.uid)
                                 .startrider(
                                 snapshot.data!['no of riders'] + 1,
                                 user.uid
                             );

                             await DatabaseService(uid: user.uid)
                                 .riderregistered();
                             await DatabaseService(uid: user.uid)
                                 .startrider1(widget.uid!);

                             Navigator.pop(context);

                             showTopSnackBar(context, CustomSnackBar.success(message: "You signed up for this campaign Successfully !"));

                           },
                           child: Text("Confirm",
                               style:TextStyle(
                                   fontWeight: FontWeight.w700
                               )
                           )
                       ),

                     ],

                   );
                   showDialog(context: context,
                       builder: (BuildContext context) {
                         return alert;
                       });
                 },
                 child: Container(
                   height: 40.0,
                   width: 100,
                   padding: EdgeInsets.symmetric(horizontal: 15.0,),
                   decoration: BoxDecoration(
                     color: Colors.green,
                     borderRadius: BorderRadius.circular(8.0),),
                   child: Center(
                     child: Text("Participate",
                       style: TextStyle(
                         color: Colors.black,
                         //fontWeight: FontWeight.w700,
                         fontSize: 12,
                       ),),
                   ),),
               ),
             );
          }
          return Loading();
        }
);
  }

  @override
  Widget build(BuildContext context) {
    var f1 = file1 != null ? basename(file1!.path) : ' ';
    return Scaffold (
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(" Campaigns",
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
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance.collection('users').doc(user.uid).snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot ) {
              if (snapshot.hasError) {
                return Center(child: Text('Something went wrong'));
              }
              if(snapshot.connectionState == ConnectionState.waiting){
                return Loading();
              }
              if (snapshot.hasData) {
                return Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [

                      SizedBox(height: 20,),

                      (snapshot.data!["1time"] == 'no') ?
                        pbutton() : Container(height:1,width:1),
                      SizedBox(height: 10,),
                      Center(
                          child: Text("Once you receive Advertising box , Upload a picture of your bicycle with advertising box installed ",)
                        ,),

                      SizedBox(height: 20,),

                        Center(
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: (){

          if(snapshot.data!['campaign id'] == widget.uid) {
            if (snapshot.data!['upload'] == 'no') {
              final snackBar = SnackBar(content: Text("Advertising box is not yet sent to your address or you are in another campaign"));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //showTopSnackBar(context, CustomSnackBar.info(message: "   Advertising box is not yet sent to your address or you are in another campaign    "));
            }
            else {
              if (kIsWeb) {
                selectweb1();
              }
              else {
                selectFile1();
              }
            }
          }
          else{
            showTopSnackBar(context, CustomSnackBar.error(message: "You have not signed up for this campaign"));
          }
                                },
                                child: Text("Select file"),
                              ),
                              SizedBox(width: 50,),
                              ElevatedButton(
                                onPressed: () async {

    if(snapshot.data!['campaign id'] == widget.uid) {
      if (snapshot.data!['upload'] == 'no') {
        final snackBar = SnackBar(content: Text("Advertising box is not yet sent to your address or you are in another campaign"));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

       // showTopSnackBar(context, CustomSnackBar.info(message: "Advertising box is not yet sent to your address or you are in another campaign"));

      }

      else {
        if (kIsWeb) {
          uploadweb1();
          await DatabaseService(uid: user.uid).riderupload(url1);
          final snackBar = SnackBar(content: Text(" Upload success ! Once, uploaded picture is verified you can start your campaign by scanning QR"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

        //  showTopSnackBar(context, CustomSnackBar.success(message: " Upload success ! Once, uploaded picture is verified you can start your campaign by scanning QR"));

        }

        else {
          uploadFile1();
          await DatabaseService(uid: user.uid).riderupload(url1);
          final snackBar = SnackBar(content: Text(" Upload success ! Once, uploaded picture is verified you can start your campaign by scanning QR"));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }



      }
    }
    else{
      showTopSnackBar(context, CustomSnackBar.error(message: "You have not signed up for this campaign "));

    }
                                },
                                child: Text("Upload"),
                              ),
                            ],
                          ),
                        ),



                      SizedBox(height: 10,),
                      Center(
                        child: Text(
                            kIsWeb ? a1! : f1,
                        ),
                      ),
                      SizedBox(height: 30,),
                    ],

                  ),
                );
              }
              return Loading();
            }
        ),
      ),
    );
  }
}