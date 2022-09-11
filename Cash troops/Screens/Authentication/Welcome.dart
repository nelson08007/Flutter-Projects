import 'package:cashtroopsdemo/Screens/Authentication/Login.dart';
import 'package:cashtroopsdemo/Screens/Authentication/Signup.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('Assets/welcome.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6),
                    BlendMode.darken
                ),
              ),
              gradient:  LinearGradient(
                  colors: [Colors.black,Colors.black12],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter
              ),
            ),

          ),
            Column(
              children: [
                //logo
                Container(
                  child: Align(
                    alignment: FractionalOffset(0.5, 0.0),
                    child: Container(
                      margin: EdgeInsets.only(top: 110.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[600],
                            blurRadius:
                            20.0, // has the effect of softening the shadow
                            spreadRadius:
                            0, // has the effect of extending the shadow
                            // offset: Offset(
                            //   10.0, // horizontal, move right 10
                            //   10.0, // vertical, move down 10
                            // ),
                          )
                        ],
                      ),
                      child: Text("Cash troops",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      //Image.asset('assets/images/Medtrics_Icon.png', width: 70),
                    ),
                  ),
                ),
                SizedBox(height: height/5.5,),
                //slogan 1
                Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Uniting People with \nPossibilities',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
                //slogan 2
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    'We do provide an better way for cash deposit,withdrawal and transfer.',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 18.0),
                  constraints: BoxConstraints(
                    maxWidth: 330.0,
                  ),
                ),
                //signup
                TextButton(
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen() ));
                  },
                  child: Container(
                    height: height/14,
                    width: width/1.5,
                    padding: EdgeInsets.symmetric(horizontal: 28.0,),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                      child: Center(
                        child: Text("Sign Up",
                          style: TextStyle(
                              color: Colors.red,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ),

                  ),
                ),
                SizedBox(height: 15,),
                //login
                TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen() ));
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
                      child: Text("Log In",
                        style: TextStyle(
                            color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}