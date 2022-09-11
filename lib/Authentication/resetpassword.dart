import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  late String _email3;
  final FirebaseAuth _auth = FirebaseAuth.instance ;
  String? validateEmail(String? value){
    Pattern pattern=
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_'{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern as String);
    if(!regex.hasMatch(value!) || value == null )
      return "Enter an valid email address";
    else
      return null;
  }
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text("Reset Password",
        style: TextStyle(

        ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
body: Container(
  padding: EdgeInsets.all(20),
  child: Form(
    key: _formKey1,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height:20),
        Text("Enter your Email",
          style: TextStyle(

            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height:20),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: TextFormField(
            style: TextStyle(
                color:Colors.black
            ),
            validator: validateEmail,
            onChanged: (val){
              setState(() {
                _email3 =val;
              });
            },
            obscureText: false,
            keyboardType:  TextInputType.emailAddress ,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.mail_outline,
                color: Colors.green,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Palette.textColor1),
                borderRadius: BorderRadius.all(Radius.circular(35.0)),
              ),
              contentPadding: EdgeInsets.all(10),
              hintText: "Enter your email",
              hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
            ),
          ),
        ),
        TextButton(
          onPressed: (){
            if(_formKey1.currentState!.validate()){
              _auth.sendPasswordResetEmail(email: _email3);
              showTopSnackBar(context, CustomSnackBar.success(message: "Password reset link has been sent to your email "));

              Navigator.pop(context);
            }
          },
          child: Container(
            height: 30.0,
            padding: EdgeInsets.symmetric(horizontal: 15.0,),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8.0),),
            child: Center(
              child: Text("Reset",
                style: TextStyle(
                  color: Colors.white,
                  //fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),),
            ),),
        ),

      ],
    ),
  ),
),
    );
  }
}
