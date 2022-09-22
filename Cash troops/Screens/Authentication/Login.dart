import 'package:cashtroopsdemo/Screens/Authentication/ForgotPassword.dart';
import 'package:cashtroopsdemo/Services/AuthService.dart';
import 'package:cashtroopsdemo/Screens/Authentication/Signup.dart';
import 'package:cashtroopsdemo/main.dart';
import 'package:flutter/material.dart';
import 'package:cashtroopsdemo/Components/Components.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}




class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {


  //signin key
  final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();
  String _email;
  String _password;
  String error;
  final AuthService _auth =AuthService();

  String validateEmail1(String value){
    Pattern pattern=
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_'{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = new RegExp(pattern as String);
    if(!regex.hasMatch(value) || value == null )
      return "Enter an valid email address";
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Form(
        key: _formKey1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40.0),

            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 10.0),
            // Image.asset(
            //   "Assets/login.png",
            //   height:50
            // ),
            SizedBox(height: 40.0),
            // Email
            Padding(
              padding: EdgeInsets.fromLTRB(15, 20, 15, 15),
              child: TextFormField(
                style: TextStyle(
                    color:Colors.black
                ),
                validator: validateEmail1,
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
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  ),
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Enter your email",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ),
            //Password
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 20),
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
                  if(val.isEmpty){
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
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  ),
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Enter your password",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ),
            //forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword() ));

                  },
                  child: Text("Forgot Password?",
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                )
              ],
            ),

            //login button
            TextButton(
              onPressed: () async {
                if(_formKey1.currentState.validate()) {
                  error = await  _auth.signIn(_email, _password);
                  Components.notify(context, error);
                  if(error=='Signed In'){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ));
                  }
                }
              },
              child: Container(
                height: height/14,
                width: width/1.5,
                padding: EdgeInsets.symmetric(horizontal: 28.0,),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.0),
                ),

                child: Center(
                  child: Text("Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

              ),
            ),


            SizedBox(height: 10.0),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
