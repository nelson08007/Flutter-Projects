import 'dart:async';
import 'package:cashtroopsdemo/Screens/Authentication/Welcome.dart';
import 'package:cashtroopsdemo/Screens/AfterLogin/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cashtroopsdemo/Utils/Theme.dart';
import 'package:cashtroopsdemo/Utils/UserPreferences.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserPreferences.init();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    final mode = UserPreferences.getUser();
    return ThemeProvider(
      initTheme: mode  ? MyThemes.darkTheme: MyThemes.lightTheme,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Cash troops',
            theme: ThemeProvider.of(context),
            home: HomePage(),
          );
        }
      ),
    );
  }
}

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void initState(){
    super.initState();
    Timer(Duration(seconds: 4), ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => Controller() )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 150,),
            Center(
              child: Text("Cash troops",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: SpinKitRotatingCircle(
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

class Controller extends StatelessWidget {
  const Controller({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return Center(child: CircularProgressIndicator());
          }
          final user = snapshot.data;
          if(user == null){
            return Scaffold(
              body: WelcomePage(),
            );
          }
          else{
            return Home();
          }
        }
    );

  }
}


