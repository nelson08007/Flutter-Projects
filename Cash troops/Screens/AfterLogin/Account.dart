import 'dart:io';
import 'package:cashtroopsdemo/Components/Components.dart';
import 'package:cashtroopsdemo/Services/AuthService.dart';
import 'package:cashtroopsdemo/Services/DatabaseService.dart';
import 'package:cashtroopsdemo/Services/LocationService.dart';
import 'package:cashtroopsdemo/Utils/Theme.dart';
import 'package:cashtroopsdemo/Utils/UserPreferences.dart';
import 'package:cashtroopsdemo/main.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:path_provider/path_provider.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final AuthService _auth = AuthService();
  bool isDark = false;
  String error;
  String image= "Assets/virat.jpg";
  User user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    isDark = UserPreferences.getUser();
  }

  void change() {
    setState(() {
      isDark = !isDark;
    });
  }

  void imgChange(String path) {
    setState(() {
      image = path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('users').doc(user.uid).snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot ) {
          if (snapshot.hasError){
            return Text("Error: ${snapshot.error}");
          }
          else if (snapshot.hasData){
            final color = Theme.of(context).scaffoldBackgroundColor;
            bool isDeposit = snapshot.data['deposit'];
            bool isWithdraw = snapshot.data['withdraw'];

            void toggleDeposit(bool value) {
              if (isDeposit == false) {
                setState(() {
                  isDeposit = true;
                });
                DatabaseService(uid: user.uid).toggleDeposit(isDeposit);
                LocationService(uid: user.uid).getlocation();
                Components.notify(context, isDeposit ? " Deposit turned ON ": " Deposit turned ON ");
              }
              else{
                setState(() {
                  isDeposit = false;
                });
                DatabaseService(uid: user.uid).toggleDeposit(isDeposit);
                LocationService(uid: user.uid).getlocation();
                Components.notify(context, isDeposit ? " Deposit turned ON ": " Deposit turned ON ");
              }
            }

            void toggleWithdraw(bool value) {
              if (isWithdraw == false) {
                setState(() {
                  isWithdraw = true;
                });
                DatabaseService(uid: user.uid).toggleWithdraw(isWithdraw);
                LocationService(uid: user.uid).getlocation();
                Components.notify(context, isWithdraw ? " Deposit turned ON ": " Deposit turned ON ");
              }
              else{
                setState(() {
                  isWithdraw = false;
                });
                DatabaseService(uid: user.uid).toggleWithdraw(isWithdraw);
                LocationService(uid: user.uid).getlocation();
                Components.notify(context, isWithdraw ? " Withdraw turned ON ": " Withdraw turned ON ");
              }
            }

            return ThemeSwitchingArea(
              child: Builder(
                builder: (context) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      actions: [
                        ThemeSwitcher(
                            builder: (context) => IconButton(
                             icon: isDark ? Icon(Icons.light_mode_outlined) : Icon(Icons.dark_mode_outlined),
                              onPressed: (){
                               final theme = isDark ?  MyThemes.lightTheme  : MyThemes.darkTheme;
                               final switcher = ThemeSwitcher.of(context);
                               switcher.changeTheme(theme: theme);
                                change();
                               UserPreferences.setUser(isDark);
                              },
                            ),
                        )
                      ],
                    ),
                    body: ListView(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      physics: BouncingScrollPhysics(),
                      children: [
                        ProfileWidget(
                          imagePath: image,
                          isEdit: true,
                          onClicked: () async {
                            final image = await ImagePicker()
                                .pickImage(source: ImageSource.gallery);

                            if (image == null) return;

                            final directory = await getApplicationDocumentsDirectory();
                            final name = basename(image.path);
                            final imageFile = File('${directory.path}/$name');
                            final newImage =
                            await File(image.path).copy(imageFile.path);
                            imgChange(newImage.path);
                            //setState(() => user = user.copy(imagePath: newImage.path));
                          },
                        ),
                        SizedBox(height: 20,),
                        Card(
                          elevation: 10,
                          color: color,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          child: ListTile(
                            onTap: (){},
                            contentPadding: EdgeInsets.zero,
                            leading: Image.asset("Assets/deposit.png"),
                            title: Text("Enable Request for Cash deposit",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),

                            ),
                            subtitle: Text("By Enabling this , People will send request for cash deposit",
                              style: TextStyle(
                                color:Colors.grey,
                                fontSize: 12,

                              ),

                            ),
                            trailing: Switch(
                              onChanged:toggleDeposit,
                              value: isDeposit,
                              activeColor: Colors.green,
                            ),
                          ),
                        ),
                        SizedBox(height: 12,),
                        Card(
                          elevation: 10,
                          color: color,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                          child: ListTile(
                            onTap: (){},
                            contentPadding: EdgeInsets.zero,
                            leading: Image.asset("Assets/withdraw.png"),
                            title: Text("Enable Request for Cash withdrawal",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),

                            ),
                            subtitle: Text("By Enabling this , People will send request for cash deposit",
                              style: TextStyle(
                                color:Colors.grey,
                                fontSize: 12,

                              ),

                            ),
                            trailing: Switch(
                              onChanged:toggleWithdraw,
                              value: isWithdraw,
                              activeColor: Colors.green,
                            ),
                          ),
                        ),
                        SizedBox(height: 24,),
                        TextButton(
                          onPressed: () async {
                            error =await _auth.signOut();
                            Components.notify(context, error);
                            if(error=='Signed Out'){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage() ));
                            }
                          },
                          child: Container(
                            height: 70,
                            width: 180,
                            padding: EdgeInsets.symmetric(horizontal: 28.0,),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            child: Center(
                              child: Text("Log Out",
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
                  );
                }
              ),
            );
          }
          return CircularProgressIndicator();
        }
    );




  }
}
