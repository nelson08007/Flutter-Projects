import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:covid/Screens/home.dart';
import 'package:covid/constants.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:covid/Screens/info.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';
int initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen",1);
  print('initScreen ${initScreen}');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Covid App',
          theme: ThemeData(
            fontFamily: 'Ubuntu',
          ),
          initialRoute: initScreen == 0 || initScreen == null ? "first" : "/",
          routes: {
            '/': (context) => HomeScreen(),
            'first' : (context) => Info(),
          },
        );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 6),
        ()=> Navigator.of(context).push(  PageRouteTransition(
            animationType: AnimationType.slide_left,
            builder: (context) => Home()
        )
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: [
           SizedBox(height: 150,),
          Image.asset("Assets/Logo.png",
          width: 200.0,
          height: 200.0,),
           SizedBox(height: 20,),
           Center(
         child: AnimatedTextKit(
               animatedTexts: [
                 FadeAnimatedText(
                   "Q MATE",
                   textStyle: TextStyle(
                   color: Colors.black,
                   fontWeight: FontWeight.w700,
                   fontSize: 30,),),
                 FadeAnimatedText("QUARANTINE MATE",textStyle: TextStyle(
                   color: Colors.black,
                   fontWeight: FontWeight.w700,
                   fontSize: 30,),),
               ],
             ),

           ),
           SizedBox(height: 20,),
            Center(
              child: SpinKitPumpingHeart(
               color: Colors.red,
               size: 50.0,
           ),
            ),
         ],
       ),
     ),
    );
  }
}
