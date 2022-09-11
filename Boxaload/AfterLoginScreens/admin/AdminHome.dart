//import 'package:box_aload/AfterLoginScreens/admin/adminview1.dart';
//import 'package:box_aload/Components/loading.dart';
import 'package:box_aload/AfterLoginScreens/admin/adminview1.dart';
import 'package:box_aload/Components/dark.dart';
import 'package:box_aload/Components/loading.dart';
import 'package:box_aload/services/DatabaseService.dart';
import 'package:flutter/material.dart';
import 'package:box_aload/services/Auth.dart';
import 'package:box_aload/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:url_launcher/url_launcher.dart';
//import 'package:box_aload/services/DatabaseService.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {

  String? error;
  final AuthService _auth = AuthService();

  delmarker(String id ){
    FirebaseFirestore.instance.collection('markers').where('campaign id',isEqualTo: id).get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((element) async {
        await DatabaseService(uid: id).delad();
        await DatabaseService(uid: element.id).delrider();
        await DatabaseService(uid: element.id).del(element.id);
      });
    }
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 10.0,
          leading: Builder(builder: (context) => // Ensure Scaffold is in context
          IconButton(
              icon: Icon(Icons.menu,),
              onPressed: () => Scaffold.of(context).openDrawer()
          )),
          title:   Image.asset("assets/Logo.png",
            width: 80.0,
            height: 65.0,
          ),
        ),
      ),
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50)
        ),
        child: Drawer(
          child: SafeArea(
            child: Container(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    height: 80.0,
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/Logo.png",
                          // width: 200.0,
                          // height: 200.0,
                        ),
                        SizedBox(width: 40,),
                      ],
                    ),),
                  Container(
                    child: ListTile(
                      onTap: ()  {

                        Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHome() ));

                      },
                      leading:
                      Icon(Icons.campaign, size: 20.0,color: Colors.green,),
                      title: Text("Campaign request",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),),
                      dense: true,
                      // padding: EdgeInsets.zero,
                    ),
                  ),
                  //darkmode
                  Container(
                    child: ListTile(
                      leading:
                      Icon(Icons.nightlight_round, size: 20.0,color: Colors.green,),
                      title: Text("Darkmode",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),),
                      trailing: ChangeThemeButtonWidget(),
                      dense: true,
                      // padding: EdgeInsets.zero,
                    ),
                  ),
                  Container(
                    child: ListTile(
                      onTap: () async {
                        error =await _auth.signOut();
                        final snackBar = SnackBar(content: Text(error!));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        if(error=='Signed Out'){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage() ));
                        }
                      },
                      leading:
                      Icon(Icons.logout, size: 20.0,color: Colors.green,),
                      title: Text("Log out",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),),
                      dense: true,
                      // padding: EdgeInsets.zero,
                    ),
                  ),
                  Container(
                    height: 400,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
      child: StreamBuilder<QuerySnapshot>(
  stream: FirebaseFirestore.instance.collection('campaign').snapshots(),
  builder: (BuildContext context , AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasError) {
      return Text('Something went wrong');
    }
    if(snapshot.connectionState == ConnectionState.waiting){
      return Text("loading");
    }

    if (snapshot.hasData) {
      return ListView(
        children: snapshot.data!.docs.map((DocumentSnapshot document) {
          return  Card(
            color: Theme.of(context).scaffoldBackgroundColor,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Adminview1(document['uid']) ));
              },
              onLongPress: (){
                AlertDialog alert = AlertDialog(
                  content: Text(
                      " Do you want to delete this campaign ?"),
                  actions: [
                    ElevatedButton(onPressed: () {
                      Navigator.pop(context);
                    },
                        child: Text("Cancel",
                            style:TextStyle(
                                fontWeight: FontWeight.w700
                            )
                        )
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          delmarker(document.id);

                          FirebaseFirestore.instance.collection('campaign').doc(document.id).delete();
                          Navigator.pop(context);
                        },
                        child: Text("Confirm",
                            style:TextStyle(
                                fontWeight: FontWeight.w700
                            )
                        )
                    ),

                  ],

                );
                showDialog(context: context,
                    builder: (BuildContext context) {
                      return alert;
                    });
              },
              
              leading:CircleAvatar(
                child: Image.asset(
                  "assets/horn.png",
                ),
                backgroundColor: Theme.of(context).primaryColor,
                radius: 25.0,
              ),
              title: Text( document['title'] ,
                style: TextStyle(

                    fontWeight: FontWeight.w700
                ),),
              subtitle: Text( document['description'],
                style: TextStyle(color: Colors.grey,
                  //fontWeight: FontWeight.w700,
                ),),
              trailing: (document.data() as dynamic)['status'] == 'pending' ?
              Icon( Icons.pending_actions, color: Colors.grey,) :
              Icon( Icons.check_circle, color: Colors.green,),
            ),
          );
        }).toList(),
      );
    }
    return Loading();
  },
),
      ),
    );
  }
}
