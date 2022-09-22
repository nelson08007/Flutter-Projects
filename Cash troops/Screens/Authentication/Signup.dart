
import 'package:cashtroopsdemo/Screens/Authentication/Login.dart';
import 'package:cashtroopsdemo/Services/AuthService.dart';
import 'package:cashtroopsdemo/main.dart';
import 'package:flutter/material.dart';
import 'package:cashtroopsdemo/Components/Components.dart';
import 'package:cashtroopsdemo/Utils/UserPreferences.dart';
class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}




class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ValueChanged<String> onChanged;

  //signup key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email;
  String _name;
  String _mobile;
  String _password;
  String _password1;
  String error;
  final AuthService _auth =AuthService();

  String validateEmail(String value){
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
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30.0),
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: 10.0),

            //name
            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 15, 10),
              child: TextFormField(
                style: TextStyle(
                    color:Colors.black
                ),
                validator: (val){
                  if(val.isEmpty){
                    return "Enter your name";
                  }
                  return null;
                },
                onChanged: (val){
                  setState(() {
                    _name=val;
                  });
                },

                obscureText: false,
                keyboardType:  TextInputType.name,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
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
                  hintText: "Enter your name",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ),

            //mobile
            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 15, 10),
              child: TextFormField(
                style: TextStyle(
                    color:Colors.black
                ),
                validator: (val){
                  if(val.isEmpty){
                    return "Enter your mobile number";
                  }
                  return null;
                },
                onChanged: (val){
                  setState(() {
                    _mobile=val;
                  });
                },

                obscureText: false,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.call,
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
                  hintText: "Enter your mobile number",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ),
            //email
            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 15, 10),
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
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  ),
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Enter your email address",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ),
            //password
            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 15, 10),
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
            //confirm password
            Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 15, 20),
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
                  if(val.isEmpty){
                    return "Password is Empty";
                  }
                  if(_password != _password1){
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
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(35.0)),
                  ),
                  contentPadding: EdgeInsets.all(10),
                  hintText: "Confirm your password",
                  hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
            ),

            //signup button
            TextButton(
              onPressed: () async {
                if(_formKey.currentState.validate()) {
                  error = await  _auth.signUp(_email, _password,_name,_mobile);
                  Components.notify(context, error);
                  UserPreferences.setUser(false);
                  if(error=="Signed Up"){
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
                  child: Text("Signup",
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
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            // OrDivider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     SocalIcon(
            //       iconSrc: "assets/icons/facebook.svg",
            //       press: () {},
            //     ),
            //     SocalIcon(
            //       iconSrc: "assets/icons/twitter.svg",
            //       press: () {},
            //     ),
            //     SocalIcon(
            //       iconSrc: "assets/icons/google-plus.svg",
            //       press: () {},
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );


  }
}
