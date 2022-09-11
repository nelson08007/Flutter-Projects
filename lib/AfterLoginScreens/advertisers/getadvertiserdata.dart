import 'package:box_aload/services/Auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:box_aload/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:box_aload/Components/loading.dart';
import 'package:box_aload/services/DatabaseService.dart';
import 'package:box_aload/AfterLoginScreens/advertisers/view.dart';
import 'package:box_aload/AfterLoginScreens/advertisers/advertiserhome.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';

class Palette {
  static const Color iconColor = Color(0xFFB6C7D1);
  static const Color activeColor = Color(0xFF09126C);
  static const Color textColor1 = Color(0XFFA7BCC7);
  static const Color textColor2 = Color(0XFF9BB3C0);
  static const Color facebookColor = Color(0xFF3B5999);
  static const Color googleColor = Color(0xFFDE4B39);
  static const Color backgroundColor = Color(0xFFECF3F9);
}



class GetAdvertiserData extends StatefulWidget {
  @override
  _GetAdvertiserDataState createState() => _GetAdvertiserDataState();
}

class _GetAdvertiserDataState extends State<GetAdvertiserData> {
String? error;
final AuthService _auth = AuthService();
String? _firstname;
String? _lastname;
String? _company;
String? _phone;
String? _address;
String? _city;
String? _zipcode;


  //final AuthService _auth = AuthService();
User? user = FirebaseAuth.instance.currentUser;
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 sndemail () async{
   await user!.sendEmailVerification();
 }

 @override
  void initState() {
    super.initState();

    if (!user!.emailVerified){
     sndemail();
     final snackBar1 = SnackBar(content: Text("A Verification link has been sent your email , Kindly verify your email "));
     ScaffoldMessenger.of(context).showSnackBar(snackBar1);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Profile",),
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
             return  Container(
               padding: EdgeInsets.all(20),
               child: SingleChildScrollView(
                 child: Form(
                   key: _formKey,
                   child: Column(
                     children: [
                       SizedBox(height: 20,),
                       Center(child: Text("Enter your Information", style:TextStyle(
                         fontWeight: FontWeight.w700,
                         color: Colors.green,
                         fontSize: 30,
                       ))),
                       SizedBox(height: 20,),
                       Align(alignment: Alignment.topLeft,
                           child: Text("First name",
                             style: TextStyle(

                               fontWeight: FontWeight.bold,
                             ),
                           )),
                       SizedBox(height: 10,),
                       TextFormField(
                         validator: (val) {
                           if (val!.isEmpty) {
                             return "Enter your first name";
                           }
                           return null;
                         },
                         onChanged: (val){
                           setState(() {
                             _firstname=val;
                           });
                         },
                         keyboardType:  TextInputType.text,
                         decoration: InputDecoration(
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Palette.textColor1),
                             borderRadius: BorderRadius.all(Radius.circular(35.0)),
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Palette.textColor1),
                             borderRadius: BorderRadius.all(Radius.circular(35.0)),
                           ),
                           contentPadding: EdgeInsets.all(10),
                           hintText: snapshot.data!['first name'],
                           hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                         ),
                       ),
                       SizedBox(height: 20,),
                       Align(
                           alignment: Alignment.topLeft,
                           child: Text("Last name",
                             style: TextStyle(

                               fontWeight: FontWeight.bold,
                             ),
                           )),
                       SizedBox(height: 10,),
                       TextFormField(
                         validator: (val) {
                           if (val!.isEmpty) {
                             return "Enter your Last name";
                           }
                           return null;
                         },
                         onChanged: (val){
                           setState(() {
                             _lastname=val;
                           });
                         },
                         keyboardType:  TextInputType.text,
                         decoration: InputDecoration(
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Palette.textColor1),
                             borderRadius: BorderRadius.all(Radius.circular(35.0)),
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Palette.textColor1),
                             borderRadius: BorderRadius.all(Radius.circular(35.0)),
                           ),
                           contentPadding: EdgeInsets.all(10),
                           hintText: snapshot.data!['last name'],
                           hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                         ),
                       ),
                       SizedBox(height: 20,),
                       Align(
                           alignment: Alignment.topLeft,
                           child: Text("Company name",
                             style: TextStyle(

                               fontWeight: FontWeight.bold,
                             ),
                           )),
                       SizedBox(height: 10,),
                       TextFormField(
                         validator: (val) {
                           if (val!.isEmpty) {
                             return "Enter your Company name";
                           }
                           return null;
                         },
                         onChanged: (val){
                           setState(() {
                             _company=val;
                           });
                         },
                         keyboardType:  TextInputType.text,
                         decoration: InputDecoration(
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Palette.textColor1),
                             borderRadius: BorderRadius.all(Radius.circular(35.0)),
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Palette.textColor1),
                             borderRadius: BorderRadius.all(Radius.circular(35.0)),
                           ),
                           contentPadding: EdgeInsets.all(10),
                           hintText: snapshot.data!['company'],
                           hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                         ),
                       ),
                       SizedBox(height: 20,),
                       Align(
                           alignment: Alignment.topLeft,
                           child: Text("Phone number",
                             style: TextStyle(

                               fontWeight: FontWeight.bold,
                             ),
                           )),
                       SizedBox(height: 10,),
                       TextFormField(
                         validator: (val) {
                           if (val!.isEmpty) {
                             return "Enter your phone number";
                           }
                           return null;
                         },
                         onChanged: (val){
                           setState(() {
                             _phone=val;
                           });
                         },
                         keyboardType:  TextInputType.text,
                         decoration: InputDecoration(
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Palette.textColor1),
                             borderRadius: BorderRadius.all(Radius.circular(35.0)),
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Palette.textColor1),
                             borderRadius: BorderRadius.all(Radius.circular(35.0)),
                           ),
                           contentPadding: EdgeInsets.all(10),
                           hintText: snapshot.data!['phone number'],
                           hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                         ),
                       ),
                       SizedBox(height: 20,),
                       Align(
                           alignment: Alignment.topLeft,
                           child: Text("Address",
                             style: TextStyle(

                               fontWeight: FontWeight.bold,
                             ),
                           )),
                       SizedBox(height: 10,),
                       TextFormField(
                         validator: (val) {
                           if (val!.isEmpty) {
                             return "Enter your address";
                           }
                           return null;
                         },
                         onChanged: (val){
                           setState(() {
                             _address=val;
                           });
                         },
                         keyboardType:  TextInputType.text,
                         decoration: InputDecoration(
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Palette.textColor1),
                             borderRadius: BorderRadius.all(Radius.circular(35.0)),
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Palette.textColor1),
                             borderRadius: BorderRadius.all(Radius.circular(35.0)),
                           ),
                           contentPadding: EdgeInsets.all(10),
                           hintText: snapshot.data!['address'],
                           hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                         ),
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
                       TextFormField(
                         validator: (val) {
                           if (val!.isEmpty) {
                             return "Enter your city";
                           }
                           return null;
                         },
                         onChanged: (val){
                           setState(() {
                             _city=val;
                           });
                         },
                         keyboardType:  TextInputType.text,
                         decoration: InputDecoration(
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Palette.textColor1),
                             borderRadius: BorderRadius.all(Radius.circular(35.0)),
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Palette.textColor1),
                             borderRadius: BorderRadius.all(Radius.circular(35.0)),
                           ),
                           contentPadding: EdgeInsets.all(10),
                           hintText: snapshot.data!['city'],
                           hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                         ),
                       ),
                       SizedBox(height: 20,),
                       Align(
                           alignment: Alignment.topLeft,
                           child: Text("Zipcode",
                             style: TextStyle(

                               fontWeight: FontWeight.bold,
                             ),
                           )),
                       SizedBox(height: 10,),
                       TextFormField(
                         validator: (val) {
                           if (val!.isEmpty) {
                             return "Enter your zipcode";
                           }
                           return null;
                         },
                         onChanged: (val){
                           setState(() {
                             _zipcode=val;
                           });
                         },
                         keyboardType:  TextInputType.text,
                         decoration: InputDecoration(
                           enabledBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Palette.textColor1),
                             borderRadius: BorderRadius.all(Radius.circular(35.0)),
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Palette.textColor1),
                             borderRadius: BorderRadius.all(Radius.circular(35.0)),
                           ),
                           contentPadding: EdgeInsets.all(10),
                           hintText:snapshot.data!['zipcode'],
                           hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                         ),
                       ),
                       SizedBox(height: 30,),

                       TextButton(
                         onPressed: () async  {

                           if(_formKey.currentState!.validate()) {
                             await DatabaseService(uid: user!.uid).getuserData2(
                                 _firstname,
                                 _lastname,
                                 _company,
                                 _phone,
                                 _address,
                                 _city,
                                 _zipcode,
                                 'yes'
                             );
                             showTopSnackBar(context, CustomSnackBar.success(message: " Saved Successfully ! "));
                           }
                           //
                           //   // Navigator.push(context, MaterialPageRoute(
                           //   //     builder: (context) => MyHomePage()));
                           // }


                         },
                         child: Container(
                           height: 40.0,
                           padding: EdgeInsets.symmetric(horizontal: 15.0,),
                           decoration: BoxDecoration(
                             color: Colors.green,
                             borderRadius: BorderRadius.circular(8.0),),
                           child: Center(
                             child: Text("Save",
                               style: TextStyle(
                                 color: Colors.white,
                                 //fontWeight: FontWeight.w700,
                                 fontSize: 20,
                               ),),
                           ),),
                       ),



                     ],
                   ),
                 ),
               ),


//           TextButton(
//             onPressed: () async {
// error =await _auth.signOut();
// final snackBar = SnackBar(content: Text(error));
// ScaffoldMessenger.of(context).showSnackBar(snackBar);
// if(error=='Signed Out'){
//   Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage() ));
// }
//
//             },
//             child: Text(
//               "Sign out",
//               style: TextStyle(
//                  ,
//                 fontWeight: FontWeight.w700
//               ),
//             ),
//           ),

             );
            }
            return Center(child: Loading(),);
          }
      ),



    );
  }
}
