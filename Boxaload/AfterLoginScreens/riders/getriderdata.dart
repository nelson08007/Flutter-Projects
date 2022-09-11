import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:box_aload/services/DatabaseService.dart';
import 'package:box_aload/main.dart';
import 'package:box_aload/services/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:box_aload/Components/loading.dart';
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

class GetRiderData extends StatefulWidget {
  @override
  _GetRiderDataState createState() => _GetRiderDataState();
}


class _GetRiderDataState extends State<GetRiderData> {
  final AuthService _auth = AuthService();

  DateTime? date;
  // title: 'Date',
  // text: getText(),
  // onClicked: () => pickDate(context),
  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: date ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 50),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return ;


setState(() {
  date = newDate;
});
    //setState(() => date = newDate
  }
  String getText() {
    if (date == null) {
      return 'Select Date';
    } else {
      return DateFormat('dd/MM/yyyy').format(date!);
       //return '${date.month}/${date.day}/${date.year}';
    }
  }
  //final AuthService _auth = AuthService();
  String? error;
  User? user = FirebaseAuth.instance.currentUser;

  sndemail () async{
    await user!.sendEmailVerification();
  }
String? _title= ' ';
String? _firstname;
String? _lastname;
String? _region=' ';
String? _dob;
String? _phone;
String? _street;
String? _zipcode;
String? _city;
String? _iban;
String? _bank;
String? _beni;

  @override
  void initState() {
    super.initState();

    if (!user!.emailVerified){
      sndemail();
      final snackBar1 = SnackBar(content: Text("A Verification link has been sent your email , Kindly verify your email "));
      ScaffoldMessenger.of(context).showSnackBar(snackBar1);
    }

  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("My Profile",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
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
             padding: EdgeInsets.all(20),
             child: SingleChildScrollView(
               child: Form(
                 key: _formKey,
                 child: Column(
                   children: [
                     //personal
                     SizedBox(height: 20,),
                     Center(child: Text("Personal Information", style:TextStyle(
                       fontWeight: FontWeight.w700,
                       color: Colors.green,
                       fontSize: 30,
                     ))),
                     SizedBox(height: 20,),
                     Align(
                         alignment: Alignment.topLeft,
                         child: Text("Title",
                           style: TextStyle(
                              
                             fontWeight: FontWeight.bold,
                           ),
                         )),
                     SizedBox(height: 10,),
                     DropdownButtonFormField<String>(
                       items: [
                         DropdownMenuItem<String>(
                           value: "Mr",
                           child: Text(
                             "Mr",
                             style: TextStyle(
                                 color: Colors.black
                             ),
                           ),),
                         DropdownMenuItem<String>(
                           value: "Mrs",
                           child: Text(
                             "Mrs",
                             style: TextStyle(
                                 color: Colors.black
                             ),

                           ),),
                       ],
                       onChanged: (value) async {
                         setState(() {
                           _title=value;
                         });
                       },
                       value: _title,
                       validator: (value) => value == null
                           ? 'Please fill this field' : null,
                       decoration: InputDecoration(
                         enabledBorder: UnderlineInputBorder(
                           borderSide: BorderSide(color:
                           Colors.green),),
                         focusedBorder: UnderlineInputBorder(
                           borderSide: BorderSide(color:
                           Colors.green),),
                       ),
                       elevation: 2,
                       style: TextStyle(
                           color: Colors.white, fontSize: 16),
                       isDense: true,
                       iconSize: 30.0,
                       iconEnabledColor: Colors.white,
                     ),
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
                         child: Text("Region",
                           style: TextStyle(
                              
                             fontWeight: FontWeight.bold,
                           ),)),
                     SizedBox(height: 10,),
                     DropdownButtonFormField<String>(
                       items: [
                         DropdownMenuItem<String>(
                           value: "Stockholm",
                           child: Text(
                             "Stockholm",
                             style: TextStyle(
                                 color: Colors.black
                             ),
                           ),),
                       ],
                       onChanged: (value) async {
                         setState(() {
                           _region=value;
                         });
                       },
                       value: _region,
                       validator: (value) => value == null
                           ? 'Please fill this field' : null,
                       decoration: InputDecoration(
                         enabledBorder: UnderlineInputBorder(
                           borderSide: BorderSide(color:
                           Colors.green),),
                         focusedBorder: UnderlineInputBorder(
                           borderSide: BorderSide(color:
                           Colors.green),),
                       ),
                       elevation: 2,
                       style: TextStyle(
                           color: Colors.white, fontSize: 16),
                       isDense: true,
                       iconSize: 30.0,
                       iconEnabledColor: Colors.white,
                     ),
                     SizedBox(height: 20,),
                     //date
                     Align(
                         alignment: Alignment.topLeft,
                         child: Text("Date of birth (DD/MM/YYYY)",
                           style: TextStyle(
                              
                             fontWeight: FontWeight.bold,
                           ),
                         )),
                     SizedBox(height: 10,),
                     TextButton(
                       onPressed: (){
                         pickDate(context);
                         setState(() {
                           _dob=getText();
                         });
                         //setState(() => date = newDate
                       },


                       child: Container(
                         height: 20.0,
                         padding: EdgeInsets.symmetric(horizontal: 15.0,),
                         decoration: BoxDecoration(
                            color: Colors.green,
                           borderRadius: BorderRadius.circular(8.0),),
                         child: Center(
                           child: Text(getText(),
                             style: TextStyle(
                               color: Colors.white,
                               //fontWeight: FontWeight.w700,
                               fontSize: 15,
                             ),),
                         ),),
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
                           return "Enter your Phone number";
                         }
                         return null;
                       },
                       onChanged: (val){
                         setState(() {
                           _phone=val;
                         });
                       },
                       keyboardType:  TextInputType.number,
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
                         child: Text("Street name / House no",
                           style: TextStyle(
                              
                             fontWeight: FontWeight.bold,
                           ),
                         )),
                     SizedBox(height: 10,),
                     TextFormField(
                       validator: (val) {
                         if (val!.isEmpty) {
                           return "Enter your street name and house number";
                         }
                         return null;
                       },
                       onChanged: (val){
                         setState(() {
                           _street=val;
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
                         hintText: snapshot.data!['street'],
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
                           return "Enter your Zipcode";
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
                         hintText: snapshot.data!['zipcode'],
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
                           return "Enter your City";
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
                     SizedBox(height: 30,),
                     //banking
                     Center(child: Text("Banking Information", style:TextStyle(
                         fontWeight: FontWeight.w700,
                         fontSize: 30,
                         color: Colors.green
                     ))),
                     SizedBox(height: 20,),
                     Align(
                         alignment: Alignment.topLeft,
                         child: Text("IBAN Number",

                           style: TextStyle(
                              
                             fontWeight: FontWeight.bold,
                           ),
                         )),
                     SizedBox(height: 10,),
                     TextFormField(
                       validator: (val) {
                         if (val!.isEmpty) {
                           return "Enter your IBAN number";
                         }
                         return null;
                       },
                       onChanged: (val){
                         setState(() {
                           _iban=val;
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
                         hintText: snapshot.data!['IBAN number'],
                         hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                       ),
                     ),
                     SizedBox(height: 20,),
                     Align(
                         alignment: Alignment.topLeft,
                         child: Text("Bank Name",
                           style: TextStyle(
                              
                             fontWeight: FontWeight.bold,
                           ),

                         )),
                     SizedBox(height: 10,),
                     TextFormField(
                       validator: (val) {
                         if (val!.isEmpty) {
                           return "Enter your Bank Name";
                         }
                         return null;
                       },
                       onChanged: (val){
                         setState(() {
                           _bank=val;
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
                         hintText: snapshot.data!['bank name'],
                         hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                       ),
                     ),
                     SizedBox(height: 20,),
                     Align(
                         alignment: Alignment.topLeft,
                         child: Text("Benificiary Name",

                           style: TextStyle(
                              
                             fontWeight: FontWeight.bold,
                           ),
                         )),
                     SizedBox(height: 10,),
                     TextFormField(
                       validator: (val) {
                         if (val!.isEmpty) {
                           return "Enter  Benificiary Name";
                         }
                         return null;
                       },
                       onChanged: (val){
                         setState(() {
                           _beni=val;
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
                         hintText: snapshot.data!['beneficiary name'],
                         hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                       ),
                     ),
                     SizedBox(height: 30,),

                     TextButton(
                       onPressed: () async  {
                         if(_formKey.currentState!.validate()) {
                           await DatabaseService(uid: user!.uid).getuserData(
                               _title,
                               _firstname,
                               _lastname,
                               _region,
                               _dob,
                               _phone,
                               _street,
                               _zipcode,
                               _city,
                               _iban,
                               _bank,
                               _beni,
                               "yes"
                           );
                           showTopSnackBar(context, CustomSnackBar.success(message: "  Saved Successfully !  "));
                         //   // Navigator.push(context, MaterialPageRoute(
                         //   //     builder: (context) => MyHomePage()));
                          }
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


             // TextButton(
             //   onPressed: () async {
             //    error= await _auth.signOut();
             //    final snackBar = SnackBar(content: Text(error));
             //    ScaffoldMessenger.of(context).showSnackBar(snackBar);
             //
             //    if(error=='Signed Out'){
             //      Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage() ));
             //    }
             //   },
             //   child: Text(
             //     "Sign out",
             //     style: TextStyle(
             //          
             //         fontWeight: FontWeight.w700
             //     ),
             //   ),
             // ),

           );
            }
            return Loading();
          }
      ),






    );
  }
}
