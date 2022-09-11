import 'package:box_aload/Authentication/resetpassword.dart';
import 'package:box_aload/Components/loading.dart';
import 'package:box_aload/main.dart';
import 'package:box_aload/services/Auth.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Palette {
  static const Color iconColor = Color(0xFFB6C7D1);
  static const Color activeColor = Color(0xFF09126C);
  static const Color textColor1 = Color(0XFFA7BCC7);
  static const Color textColor2 = Color(0XFF9BB3C0);
  static const Color facebookColor = Color(0xFF3B5999);
  static const Color googleColor = Color(0xFFDE4B39);
  static const Color backgroundColor = Color(0xFFECF3F9);
}

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isSignupScreen = true;
  bool isRider = true;

  String? error;
final AuthService _auth =AuthService();
  // for sign up
  String _email="";
  String _password="";
  String _password2="";  // for sign in
  String _email1="";
  String _password1="";

  //signin key
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  //singup key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.green.withOpacity(.85),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
          )
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 250,
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage("images/background.jpg"),
              //         fit: BoxFit.fill)),
              child: Container(
                padding: EdgeInsets.only(top: 35, left: 20),
                color: Colors.green.withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Welcome ",
                          style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: isSignupScreen ? " to Boxaload," : " Back,",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      isSignupScreen
                          ? "Signup to Continue"
                          : "Signin to Continue",
                      style: TextStyle(
                        letterSpacing: 1,

                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the shadow for the submit button
          buildBottomHalfContainer(true),
          //Main Contianer for Login and Signup
          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: isSignupScreen ? 110 : 180,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: isSignupScreen ? 320 : 250,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                         color:Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = false;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (!isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.green,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isSignupScreen = true;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: isSignupScreen
                                        ? Palette.activeColor
                                        : Palette.textColor1),
                              ),
                              if (isSignupScreen)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: Colors.green,
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    if (isSignupScreen) buildSignupSection(),
                    if (!isSignupScreen) buildSigninSection(),
                    SizedBox(height: 60.0),
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(false),
          // Bottom buttons
        ],
      ),
    );
  }

  Container buildSigninSection() {

    String? validateEmail1(String? value){
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
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Form(
        key: _formKey1,
        child: Column(
          children: [
        Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: TextFormField(
          style: TextStyle(
              color:Colors.black
          ),
          validator: validateEmail1,
          onChanged: (val){
            setState(() {
              _email1=val;
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
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                style: TextStyle(
                    color:Colors.black
                ),
                onChanged: (val){
                setState(() {
                  _password1=val;
                });
              },
                validator: (val){
                  if(val!.isEmpty){
                    return "Password is Empty";
                  }
                  return null;
                },
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
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
                  hintText: "Enter your password",
                  hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword() ));

                  },
                  child: Text("Forgot Password?",
                      style: TextStyle(fontSize: 12, color: Palette.textColor1)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container buildSignupSection() {


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

    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                style: TextStyle(
                    color:Colors.black
                ),
                validator: validateEmail,
                onChanged: (val){
                  setState(() {
                    _email=val;
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
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                style: TextStyle(
                    color:Colors.black
                ),
                onChanged: (val){
                  setState(() {
                    _password=val;
                  });
                },
                validator: (val){
                  if(val!.isEmpty){
                    return "Password is Empty";
                  }
                  return null;
                },
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
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
                  hintText: "Enter your password",
                  hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                style: TextStyle(
                  color:Colors.black
                ),
                onChanged: (val){
                  setState(() {
                    _password2=val;
                  });
                },
                validator: (val){
                  if(val!.isEmpty){
                    return "Password is Empty";
                  }
                  if(_password != _password2){
                    return "Password does not match";
                    
                  }
                  return null;
                },
                obscureText: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock,
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
                  hintText: "Confirm your password",
                  hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isRider = true;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              color: isRider
                                  ? Colors.green
                                  : Colors.transparent,
                              border: Border.all(
                                  width: 1,
                                  color: isRider
                                      ? Colors.transparent
                                      : Palette.textColor1),
                              borderRadius: BorderRadius.circular(15)),
                          child: Icon(
                           Icons.directions_bike,
                            color: isRider ? Colors.white : Palette.iconColor,
                          ),
                        ),
                        Text(
                          "Rider",
                          style: TextStyle( ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isRider = false;
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              color: isRider
                                  ? Colors.transparent
                                  : Colors.green,
                              border: Border.all(
                                  width: 1,
                                  color: isRider
                                      ? Palette.textColor1
                                      : Colors.transparent),
                              borderRadius: BorderRadius.circular(15)),
                          child: Icon(
                            Icons.campaign,
                            color: isRider ? Palette.iconColor : Colors.white,
                          ),
                        ),
                        Text(
                          "Advertiser",
                          style: TextStyle( ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.only(top: 20),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: "By pressing the 'Button' you agree to our ",
                    style: TextStyle(color: Palette.textColor2),
                    children: [
                      TextSpan(
                        //recognizer: ,
                        text: "term & conditions",
                        style: TextStyle( ),
                      ),
                    ]),
              ),
            ),
            SizedBox(height: 15,),

          ],
        ),
      ),
    );
  }



  Widget buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 700),
      curve: Curves.bounceInOut,
      top: isSignupScreen ? 380 : 360,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                     color:Colors.black.withOpacity(.3),
                    spreadRadius: 1.5,
                    blurRadius: 10,
                  )
              ]),
          child: !showShadow
              ? InkWell(
            onTap: () async {
if(isSignupScreen){
  if(_formKey.currentState!.validate()){
    Loading();
    if(isRider){
      error = await _auth.signUp(_email, _password, 'rider','no') ;


      if(error == "Signed Up"){
        showTopSnackBar(context, CustomSnackBar.success(message: error!));
      }else{
        showTopSnackBar(context, CustomSnackBar.error(message: error!));
      }


      if(error=='Signed Up'){
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage() ));
      }


    }
    else {
   error= await _auth.signUp(_email, _password, 'advertiser','no') ;
   if(error == "Signed Up"){
     showTopSnackBar(context, CustomSnackBar.success(message: error!));
   }else{
     showTopSnackBar(context, CustomSnackBar.error(message: error!));
   }
   if(error=='Signed Up'){
     Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage() ));
   }

    }
  }
}
else{
  if(_formKey1.currentState!.validate()) {
    Loading();

  error = await  _auth.signIn(_email1, _password1);
    if(error == 'Signed In'){
      showTopSnackBar(context, CustomSnackBar.success(message: error!));
    }else{
      showTopSnackBar(context, CustomSnackBar.error(message: error!));
    }
  if(error=='Signed In'){
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage() ));
  }
  }
}
},
            splashColor: Colors.green,
                child: Container(
            decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.green[200]!, Colors.green[400]!],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                         color:Colors.black.withOpacity(.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: Offset(0, 1))
                  ]),
            child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
            ),
          ),
              )
              : Center(),
        ),
      ),
    );
  }
}
