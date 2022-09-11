import 'package:box_aload/Components/loading.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:box_aload/services/storage.dart';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:url_launcher/url_launcher.dart';
import 'package:box_aload/services/pdfgenerator.dart';
import 'package:box_aload/services/DatabaseService.dart';
import 'package:box_aload/AfterLoginScreens/advertisers/advertiserhome.dart';


class Campaign extends StatefulWidget {
  @override
  _CampaignState createState() => _CampaignState();
}

class _CampaignState extends State<Campaign> {

  String bill = ' ';
  bool isreview=false;
  bool isupload=false;
  bool isconfirm=false;
  UploadTask? task1;
  File? file1;
  var url1;
  Uint8List? u1;
  String? a1 = "no file selected";



  UploadTask? task2;
  File? file2;
  var url2;
  Uint8List? u2;
  String? a2= "no file selected";

  UploadTask? task3;
  File? file3;
  var url3;
  Uint8List? u3;
  String? a3= "no file selected";


  UploadTask? task4;
  File? file4;
  var url4;
  Uint8List? u4;
  String? a4= "no file selected";

  UploadTask? task5;
  File? file5;
  var url5;
  Uint8List? u5;
  String? a5= "no file selected";


  User? user = FirebaseAuth.instance.currentUser;

  bool? isStockholm = false ;
  int _currentStep = 0;
  String? _title;
  String? _des;
  String _city='Stockholm';
  String? _cyclist;
  String? _weeks;

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
    final destination = 'campaign request/${user!.uid}/$fileName';

    task1 = Firebaseapi.uploadBytes(destination, u1 ?? Uint8List.fromList([]));
    setState(() {});

    if (task1 == null) return;

    final snapshot = await task1!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      url1 = urlDownload;
    });

  }
  
  Future selectweb2() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) {
      print("no files picked");
      return;
    }
    Uint8List? uploadfile = result.files.single.bytes;
    String Filename = basename(result.files.single.name );

    setState(() {
      u2 = uploadfile;
      a2 = Filename;
    });

  }

  Future uploadweb2() async {
    if (u2 == null) return;

    final fileName = a2;
    final destination = 'campaign request/${user!.uid}/$fileName';

    task2 = Firebaseapi.uploadBytes(destination, u2 ?? Uint8List.fromList([]));
    setState(() {});

    if (task2 == null) return;

    final snapshot = await task2!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      url2 = urlDownload;
    });

  }

  Future selectweb3() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) {
      print("no files picked");
      return;
    }
    Uint8List? uploadfile = result.files.single.bytes;
    String Filename = basename(result.files.single.name );

    setState(() {
      u3 = uploadfile;
      a3 = Filename;
    });

  }

  Future uploadweb3() async {
    if (u3 == null) return;

    final fileName = a3;
    final destination = 'campaign request/${user!.uid}/$fileName';

    task3 = Firebaseapi.uploadBytes(destination, u3 ?? Uint8List.fromList([]));
    setState(() {});

    if (task3 == null) return;

    final snapshot = await task3!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      url3 = urlDownload;
    });

  }

  Future selectweb4() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) {
      print("no files picked");
      return;
    }
    Uint8List? uploadfile = result.files.single.bytes;
    String Filename = basename(result.files.single.name );

    setState(() {
      u4 = uploadfile;
      a4 = Filename;
    });

  }

  Future uploadweb4() async {
    if (u4 == null) return;

    final fileName = a4;
    final destination = 'campaign request/${user!.uid}/$fileName';

    task4 = Firebaseapi.uploadBytes(destination, u4 ?? Uint8List.fromList([]));
    setState(() {});

    if (task4 == null) return;

    final snapshot = await task4!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      url4 = urlDownload;
    });

  }

  Future selectweb5() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false);
    if (result == null) {
      print("no files picked");
      return;
    }
    Uint8List? uploadfile = result.files.single.bytes;
    String Filename = basename(result.files.single.name );

    setState(() {
      u5 = uploadfile;
      a5 = Filename;
    });

  }

  Future uploadweb5() async {
    if (u5 == null) return;

    final fileName = a5;
    final destination = 'campaign request/${user!.uid}/$fileName';

    task5 = Firebaseapi.uploadBytes(destination, u5 ?? Uint8List.fromList([]));
    setState(() {});

    if (task5 == null) return;

    final snapshot = await task5!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      url5 = urlDownload;
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
    final destination = 'campaign request/${user!.uid}/$fileName';

    task1 = Firebaseapi.uploadFile(destination, file1!);
    setState(() {});

    if (task1 == null) return;

    final snapshot = await task1!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
setState(() {
  url1 = urlDownload;
});

  }

  Future selectFile2() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path;

    setState(() => file2 = File(path!));
  }

  Future uploadFile2() async {
    if (file2 == null) return;

    final fileName = basename(file2!.path);
    final destination = 'campaign request/${user!.uid}/$fileName';

    task2 = Firebaseapi.uploadFile(destination, file2!);
    setState(() {});

    if (task2 == null) return;

    final snapshot = await task2!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      url2 = urlDownload;
    });

  }

  Future selectFile3() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path;

    setState(() => file3 = File(path!));
  }

  Future uploadFile3() async {
    if (file3 == null) return;

    final fileName = basename(file3!.path);
    final destination = 'campaign request/${user!.uid}/$fileName';

    task3 = Firebaseapi.uploadFile(destination, file3!);
    setState(() {});

    if (task3 == null) return;

    final snapshot = await task3!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      url3 = urlDownload;
    });

  }

  Future selectFile4() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path;

    setState(() => file4 = File(path!));
  }

  Future uploadFile4() async {
    if (file4 == null) return;

    final fileName = basename(file4!.path);
    final destination = 'campaign request/${user!.uid}/$fileName';

    task4 = Firebaseapi.uploadFile(destination, file4!);
    setState(() {});

    if (task4 == null) return;

    final snapshot = await task4!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      url4 = urlDownload;
    });

  }

  Future selectFile5() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path;

    setState(() => file5 = File(path!));
  }

  Future uploadFile5() async {
    if (file5 == null) return;
    final fileName = basename(file5!.path);
    final destination = 'campaign request/${user!.uid}/$fileName';

    task5 = Firebaseapi.uploadFile(destination, file5!);
    setState(() {});

    if (task5 == null) return;

    final snapshot = await task5!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    setState(() {
      url5 = urlDownload;
    });

  }


  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

Widget invoice (int pur , String company , String title) {
  return StreamBuilder<DocumentSnapshot>(
      stream:  FirebaseFirestore.instance.collection('invoice').doc('price').snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot ) {
            if (snapshot.hasError){
              return Text("Error: ${snapshot.error}");
            }
            else if (snapshot.hasData){
              return TextButton(
                onPressed: () async {
                  if(kIsWeb){
                    await pdfgenerate(snapshot.data!['cost'],_weeks!,pur,_cyclist!,company,title);
                  }
                  else{

                      bill = await pdfgenerate1(snapshot.data!['cost'],_weeks!,pur,_cyclist!,company,title);

                    await launch(bill);
                  }
                },

                child: Text("Click here to download invoice",
                  style: TextStyle(
                      fontWeight: FontWeight.w700
                  ),
                ),

              );
            }
            return Loading();

          }

  );



}
bool purchase = true;
  @override
  Widget build(BuildContext context) {

    var fileName1 = file1 != null ? basename(file1!.path) : 'Select file';
    var fileName2 = file2 != null ? basename(file2!.path) : 'Select file';
    var fileName3 = file3 != null ? basename(file3!.path) : 'Select file';
    var fileName4 = file4 != null ? basename(file4!.path) : 'Select file';
    var fileName5 = file5 != null ? basename(file5!.path) : 'Select file';

    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Create campaign",
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
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection('users').doc(user!.uid).snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot ) {
            if (snapshot.hasError){
              return Text("Error: ${snapshot.error}");
            }
            else if (snapshot.hasData){
              return Container(
                child: Stepper(
                  steps:  _mySteps(
                    fileName1,
                    fileName2,
                    fileName3,
                    fileName4,
                    fileName5,
                      snapshot.data!['purchase'],
                      snapshot.data!['company']
                  ),
                  currentStep: this._currentStep,


                  onStepContinue: () async {

                    if(this._currentStep == 0) {
                      if (_formKey1.currentState!.validate()) {
                        setState(() {
                            this._currentStep=1;
                        });
                        if(purchase) {
                          await DatabaseService(uid:user.uid).addpurchase(
                              snapshot.data!['purchase'] + 1
                          );
                          setState(() {
                           purchase = false;
                          });
                        }
                      }
                    }

                    if(this._currentStep == 1){
                      if(isStockholm!){
                       setState(() {
                         this._currentStep=2;
                       });
                      }
                    }


                    if(this._currentStep == 2){
                      if(_formKey2.currentState!.validate()) {
                        setState(() {
                          this._currentStep= 3;
                        });

                      }
                    }


                    if(this._currentStep == 3){

                      if(isupload) {
                        setState(() {
                          this._currentStep = 4;
                        });
                      }
                    }


                    if(this._currentStep == 4){
                      if(isreview) {
                        setState(() {
                          this._currentStep = 5;
                        });
                      }
                    }

                    else{
                      if(isconfirm){

                        await DatabaseService(uid: user.uid).startcampaign(user.uid);

                        await DatabaseService(uid: user.uid).requestcampaign(_title ?? " ", _des ?? " ",
                            _city ,
                            _cyclist ?? ' ', _weeks ?? ' ', url1, url2, url3, url4, url5 );
                        await DatabaseService(uid: user.uid).requestcampaign1();
                        Navigator.pop(context);
                        showTopSnackBar(context, CustomSnackBar.success(message: "Campaign request suceesfully submitted ! "));

                        showTopSnackBar(context, CustomSnackBar.info(message: " Once, Payment is done . campaign will be setup for you"));


                      }


                    }

                  },
                  onStepCancel: () {
                    setState(() {
                      if(this._currentStep > 0){
                        this._currentStep = this._currentStep - 1;
                      }else{
                        this._currentStep = 0;
                      }
                    });
                  },
                ),
              );


            }
            return Loading();
          }
      ),

    );

  }

  List<Step> _mySteps(var f1, var f2 , var f3 , var f4 , var f5, int p, String company) {
    List<Step> _steps = [

      //step1
      Step(
        title: Text('Title and Description',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w700,
          ),

        ),


        content: Form(
          key: _formKey1,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Align(alignment: Alignment.topLeft,
                  child: Text("Title",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              SizedBox(height: 10,),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter  title of your campaign";
                  }
                  return null;
                },
                onChanged: (val){
                  setState(() {
                    _title=val;
                  });
                },
                keyboardType:  TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  contentPadding: EdgeInsets.all(8),
                  hintText: "Enter  title of your Campaign",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),


              SizedBox(height: 20,),
              Align(alignment: Alignment.topLeft,
                  child: Text("Description",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              SizedBox(height: 10,),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter  description of your campaign";
                  }
                  return null;
                },
                onChanged: (val){
                  setState(() {
                    _des=val;
                  });
                },
                keyboardType:  TextInputType.text,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  contentPadding: EdgeInsets.all(8),
                  hintText: "Enter  description of your Campaign",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),


        isActive: _currentStep >= 0,
      ),
      //step2
      Step(
        title: Text('Select cities where you want to run you campaign ',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w700,
          ),

        ),
        content: Row(
          children: [
            SizedBox(width: 10,),
            Checkbox(
                value: isStockholm,
                onChanged: (bool? val){
                  setState(() {
                    isStockholm=val;
                  });
                }),
            SizedBox(width: 10,),
            Text("Stockholm"),
          ],

        ),


        isActive: _currentStep >= 1,
      ),
      //step3
      Step(
        title: Text('Number of Cyclist and Weeks',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w700,
          ),

        ),
        content: Form(
          key: _formKey2,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Align(alignment: Alignment.topLeft,
                  child: Text("Number of cyclist",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              SizedBox(height: 10,),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter number of cyclist";
                  }
                  if(!isNumber(val)){
                    return "Enter number of cyclist";
                  }
                  return null;
                },
                onChanged: (val){
                  setState(() {
                    _cyclist=val;
                  });
                },
                keyboardType:  TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  contentPadding: EdgeInsets.all(8),
                  hintText: "Number of cyclist",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),


              SizedBox(height: 20,),
              Align(alignment: Alignment.topLeft, child: Text("Number of weeks",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              SizedBox(height: 10,),
              TextFormField(
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Enter number of weeks";
                  }
                  if(!isNumber(val)){
                    return "Enter number of cyclist";
                  }
                  return null;
                },
                onChanged: (val){
                  setState(() {
                    _weeks=val;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  contentPadding: EdgeInsets.all(8),
                  hintText: "Number of weeks",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),

        isActive: _currentStep >= 2,
      ),
      //step4
      Step(
        title: Text('Upload files',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w700,
          ),
        ),
        content:

           Column(
              children: [
                Column(
                  children: [
                    //file1
                    Card(
                         color: Colors.white,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: Text("Side 1",style: TextStyle(
                            color: Colors.black,
                        fontWeight: FontWeight.w700
                        ),
                        ),
                        title: Text( kIsWeb ? a1 : f1,
                          style: TextStyle(color: Colors.red),),
                        subtitle:  task1 != null ? buildUploadStatus(task1!) : Container(),
                        trailing: Icon( Icons.attach_file, color: Colors.black,),
                        onTap: () async {

                          if(kIsWeb){
                            selectweb1();

                          }
                          else{
                            selectFile1();
                          }


                        },
                      ),
                    ),
                    SizedBox(height: 5,),

//file 2
                    Card(
                      color: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: Text("Side 2",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        title: Text(kIsWeb ? a2 : f2, style: TextStyle(color: Colors.red),),
                        subtitle:  task2 != null ? buildUploadStatus(task2!) : Container(),
                        trailing: Icon( Icons.attach_file, color: Colors.black,),
                        onTap: () async {
                          if(kIsWeb){
                            selectweb2();

                          }
                          else{
                            selectFile2();
                          }

                        },
                      ),
                    ),
                    SizedBox(height: 5,),
//file 3
                    Card(
                      color: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),

                      child: ListTile(
                        leading: Text("Side 3",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700
                          ),

                        ),
                        title: Text(kIsWeb ? a3 : f3, style: TextStyle(color: Colors.red),),
                        subtitle:  task3 != null ? buildUploadStatus(task3!) : Container(),
                        trailing: Icon( Icons.attach_file, color: Colors.black,),
                        onTap: () async {
                          if(kIsWeb){
                            selectweb3();

                          }
                          else{
                            selectFile3();
                          }

                        },
                      ),
                    ),
                    SizedBox(height: 5,),
//file4
                    Card(
                      color: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: Text("Side 4",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700
                          ),

                        ),
                        title: Text(kIsWeb ? a4 : f4, style: TextStyle(color: Colors.red),),
                        subtitle:  task4 != null ? buildUploadStatus(task4!) : Container(),
                        trailing: Icon( Icons.attach_file, color: Colors.black,),
                        onTap: () async {
                          if(kIsWeb){
                            selectweb4();

                          }
                          else{
                            selectFile4();
                          }

                        },
                      ),
                    ),
                    SizedBox(height: 5,),
//file5
                    Card(
                      color: Colors.white,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: Text("Side 5",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        title: Text(kIsWeb ? a5 : f5, style: TextStyle(color: Colors.red),),
                        subtitle:  task5 != null ? buildUploadStatus(task5!) : Container(),
                        trailing: Icon( Icons.attach_file, color: Colors.black,),
                        onTap: () async {
                          if(kIsWeb){
                            selectweb5();

                          }
                          else{
                            selectFile5();
                          }

                        },
                      ),
                    ),
                    SizedBox(height: 20,),

                    TextButton(

                      onPressed: ()   {
                        if(kIsWeb){
                          uploadweb1();
                          uploadweb2();
                          uploadweb3();
                          uploadweb4();
                          uploadweb5();
                          setState(() {
                            isupload=true;
                          });
                        }
                        else{
                          uploadFile1();
                          uploadFile2();
                          uploadFile3();
                          uploadFile4();
                          uploadFile5();
                          setState(() {
                            isupload=true;
                          });
                        }

                      },
                      child: Container(
                        height: 40.0,
                        width: 100,
                        padding: EdgeInsets.symmetric(horizontal: 15.0,),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8.0),),
                        child: Center(
                          child: Text("Upload",
                            style: TextStyle(
                              color: Colors.white,
                              //fontWeight: FontWeight.w700,
                              fontSize: 12,
                            ),),
                        ),),
                    ),
                  ],
                ),
              ],
            ),



        isActive: _currentStep >= 3,

      ),

      //step5
      Step(

        title: Text('Overview of your campaign',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w700,
          ),
        ),

        content: Column(
          children: [

                SizedBox(height: 10,),

                Row(
                  children: [
                    Column(
                      children: [
                        Align(alignment: Alignment.topLeft,
                            child: Text("Title",
                              style: TextStyle(

                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        SizedBox(height: 10,),
                        Center(
                          child: Text( _title ?? " ",
                            style: TextStyle(

                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                      ],
                    ),
                    SizedBox(
                      width:60
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Align(alignment: Alignment.topLeft,
                              child: Text("Description",
                                style: TextStyle(

                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          SizedBox(height: 10,),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text( _des ?? " ",
                              style: TextStyle(

                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),

                  ],
                ),

            SizedBox(height: 20,),

            Align(
                alignment: Alignment.topLeft,
                child: Text("City",
                  style: TextStyle(

                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(height: 10,),
            Align(
              alignment: Alignment.topLeft,
              child: Text( _city,
                style: TextStyle(

                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: 20,),
            Row(
              children: [
                Column(
                  children: [
                    Align(alignment: Alignment.topLeft,
                        child: Text("Number of riders",
                          style: TextStyle(

                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    SizedBox(height: 10,),
                    Center(
                      child: Text( _cyclist ?? ' ',
                        style: TextStyle(

                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
                SizedBox(width: 60 ),
                Column(
                  children: [
                    Align(alignment: Alignment.topLeft,
                        child: Text("Number of weeks",
                          style: TextStyle(

                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    SizedBox(height: 10,),
                    Center(
                      child: Text( _weeks ?? ' ',
                        style: TextStyle(

                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),

              ],
            ),
            SizedBox(height: 20,),
            Align(
                alignment: Alignment.topLeft,
                child: Text("Uploaded files",
                  style: TextStyle(

                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(height: 10,),

           Wrap(

             children: [
               Container(
                 height:70,
                 width:70,
                 child: Image.network(url1),
               ),
               SizedBox(width:20),
               Container(
                 height:70,
                 width:70,
                 child: Image.network(url2),
               ),
               SizedBox(width:20),
               Container(
                 height:70,
                 width:70,
                 child: Image.network(url3),
               ),
               SizedBox(width:20),
               Container(
                 height:70,
                 width:70,
                 child: Image.network(url4),
               ),
               SizedBox(width:20),
               Container(
                 height:70,
                 width:70,
                 child: Image.network(url5),
               ),
               SizedBox(width:20),
             ],
           ),


            Center(
              child: TextButton(
                onPressed: () async {




                  setState(() {
                    isreview=true;
                  });

                },
                child: Container(
                  height: 40.0,
                  width: 100,
                  padding: EdgeInsets.symmetric(horizontal: 15.0,),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.0),),
                  child: Center(
                    child: Text("Verified",
                      style: TextStyle(
                        color: Colors.white,
                        //fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),),
                  ),),
              ),
            ),

          ],
        ),

        isActive: _currentStep >= 4,

      ),

      //step6
      Step(
        title: Text('Confirmation',
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w700,
          ),
        ),

        content: Column(
          children: [
            Text("Confirmation"),
            SizedBox(height : 20 ),

            //invoice
            invoice(p,company,_title!),

            SizedBox(height : 20 ),
            Center(
              child: TextButton(
                onPressed: ()  {

                  setState(() {
                    isconfirm=true;
                  });

                },
                child: Container(
                  height: 40.0,
                  width: 100,
                  padding: EdgeInsets.symmetric(horizontal: 15.0,),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8.0),),
                  child: Center(
                    child: Text("Confirm",
                      style: TextStyle(
                        color: Colors.white,
                        //fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),),
                  ),),
              ),
            ),
          ],
        ),

        isActive: _currentStep >= 5,

      ),



    ];
    return _steps;
  }

bool isNumber (String result){
    if(result==null){
      return false;
    }
    return double.tryParse(result) != null;
}
  Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
    stream: task.snapshotEvents,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        final snap = snapshot.data!;
        final progress = snap.bytesTransferred / snap.totalBytes;
        final percentage = (progress * 100).toStringAsFixed(2);

        return Text(
          '$percentage %',
          style: TextStyle(
              color:Colors.green, fontSize: 10, fontWeight: FontWeight.bold),
        );
      } else {
        return Container();
      }
    },
  );
}


