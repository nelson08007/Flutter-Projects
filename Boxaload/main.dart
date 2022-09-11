// @dart=2.9
import 'dart:async';
import 'package:box_aload/AfterLoginScreens/confirm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:box_aload/Components/responsive.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:box_aload/DesktopScreens/Homedes.dart';
import 'package:box_aload/MobileScreens/Homemob.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:box_aload/Components/dark.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    builder: (context, _) {
      final themeProvider = Provider.of<ThemeProvider>(context);

      return MaterialApp(
        title: 'Boxaload',
        themeMode: themeProvider.themeMode,
        theme: MyThemes.lightTheme,
        darkTheme: MyThemes.darkTheme,
        home: MyHomePage(),
      );
    },
  );

}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 150,),
            // Text("Boxaload",
            // style: TextStyle(
            //   color: Colors.black,
            //   fontWeight: FontWeight.w700,
            //   fontSize: 30,
            // ),
            // ),
            Image.asset("assets/Logo.png",
              width: 200.0,
              height: 200.0,),

            SizedBox(height: 20,),
            Center(
              child: SpinKitRotatingCircle(
                color: Colors.green,
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
      return ResponsiveLayout(mobileBody: Homemob(),desktopBody: Homedes(),);
    }
    else{
      return Wrapper2();
    }
    }
    );
  }
  }

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    if (user == null) {
     return ResponsiveLayout(
       mobileBody: Homemob(),
       desktopBody: Homedes(),
     );
    }
    else{
      return Wrapper2();
    }
  }
}
