import 'package:covid/Screens/info.dart';
import 'package:flutter/material.dart';
import 'package:route_transitions/route_transitions.dart';
import 'package:covid/Screens/guidelines.dart';
import 'package:covid/Screens/testingcenters.dart';
import 'package:covid/constants.dart';
import 'package:covid/Screens/vaccination.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:url_launcher/url_launcher.dart';

bool s=false;
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final formKey = new GlobalKey<FormState>();
  String state1;
  String num = '104';
  String url;
  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'ncov2019@gov.in',
      queryParameters: {
        'subject': 'Need Help'
      }
  );
  _makingPhoneCall(String num) async {
    url =  'tel:'+num;
    if (await canLaunch(url)){
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
bool t=false;
  _helpline(String state)
  {

    var Number = new Map();

    Number["Andra Pradesh"] = '0866-2410978';
    Number["Arunachal Pradesh"] = '9436055743';
    Number["Assam"] = '6913347770';
    Number["Bihar"] = '104';
    Number["Chhattisgarh"] = '104';
    Number["Goa"] = '104';
    Number["Gujarat"] ='104';
    Number["Haryana"] = '8558893911';
    Number["Himachal Pradesh"] = '104';
    Number["Jharkhand"] = '104';
    Number["Karnataka"] = '104';
    Number["Kerala"] = '0471-2552056';
    Number["Madhya Pradesh"] = '104';
    Number["Maharastra"] = '020-26127394';
    Number["Manipur"] = '3852411668';
    Number["Meghalaya"] = '108';
    Number["Mizoram"] = '102';
    Number["Nagaland"] = '7005539653';
    Number["Odisha"] = '9439994859';
    Number["Punjab"] = '104';
    Number["Sikkim"] = '104';
    Number["Rajasthan"] = '0141-2225624';
    Number["Tamil Nadu"] = '044-29510500';
    Number["Telangana"] = '104';
    Number["Tripura"] = '0381-2315879';
    Number["Uttarkhand"] = '104';
    Number["Uttar Pradesh"] = '18001805145';
    Number["West Bengal"] = '1800313444222';
    Number["Andaman & Nicobar Islands"] = '03192-232102';
    Number["Chandigarh"] = '9779558282';
    Number["Dadra and Nagar Haveli"] = '104';
    Number["Delhi"] = '011-22307145';
    Number["Jammu & Kashmir"] = '0194-2440283';
    Number["Leh-Ladakh"] = '01982256462';
    Number["Puducherry"] = '104';


    return Number[state];

  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: s?Colors.black:Colors.white,
        drawerEnableOpenDragGesture: true,
        appBar: AppBar(
          backgroundColor:s?Colors.black38:Colors.blue[900],
          elevation: 0.0,
          leading: Builder(builder: (context) => // Ensure Scaffold is in context
          IconButton(
              icon: Icon(Icons.menu,color: Colors.white,),
              onPressed: () => Scaffold.of(context).openDrawer()
          )),
          title: Text("HOME"),
        ),
        drawer: Drawer(
          child: SafeArea(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(height: 80.0,
                decoration: BoxDecoration(
                  color: s?Colors.black:Colors.blue[900],
                ),
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(" QMATE",
                    style: TextStyle(
                      fontSize: 25,
                      color: s?Colors.white:Colors.black,
                      fontWeight: FontWeight.w700,
                    ),),
                    SizedBox(width: 40,),
                    Switch(
                      value: s,
                      onChanged: (value){
                        setState(() {
                          s=value;
                        });
                      },
                    ),
                  ],
                ),),
                Container(
                  color: s?Colors.grey[800]:Colors.white,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(  PageRouteTransition(
                          animationType: AnimationType.slide_left,
                          builder: (context) => Home()
                      ));
                    },
                    leading: Icon(Icons.home, size: 20.0, color: c),
                    title: Text("HOME",style: TextStyle(
                      color:s?Colors.white:Colors.black,
                    ),),
                    dense: true,
                  ),
                ),
                Container(
                  color:s?Colors.grey[800]:Colors.white,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(  PageRouteTransition(
                          animationType: AnimationType.slide_left,
                          builder: (context) => TestingCentre()
                      ));
                    },
                    leading: Icon(Icons.science, size: 20.0, color:c),
                    title: Text("TESTING CENTRES",
                      style: TextStyle(
                        color:s?Colors.white:Colors.black,
                      ),),
                    dense: true,
                    // padding: EdgeInsets.zero,
                  ),
                ),
                Container(
                  color:s?Colors.grey[800]:Colors.white,
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).push(  PageRouteTransition(
                          animationType: AnimationType.slide_left,
                          builder: (context) => Guidelines()
                      ));
                    },
                    leading:
                    Icon(Icons.build, size: 20.0, color: c),
                    title: Text(" 14 Day-Quarantine",
                      style: TextStyle(
                        color:s?Colors.white:Colors.black,
                      ),),
                    dense: true,
                    // padding: EdgeInsets.zero,
                  ),
                ),
                Container(
                  height: 400,
                  color:s?Colors.grey[800]:Colors.white,

                ),
              ],
            ),
          ),

        ),
        body: Container(
          decoration: BoxDecoration(
              color:s?Colors.black:Colors.blue[900],
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
            Container(
            height: 50 ,
            width: double.infinity,
            decoration: BoxDecoration(
             color: s?Colors.black45:Colors.blue[900],
            ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 60),
              alignment: Alignment.topCenter,
              height: 600,
              decoration: BoxDecoration(
                color: s?Colors.grey[900]:Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height : 10,),
                  Center(
                    child: Text("QUARNTINE MATE",
                    style: TextStyle(
                      color: s?Colors.white:Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),),
                  ),
                  SizedBox(height : 30,),
                  Center(
                    child: Row(
                      children: [
                        SizedBox(width: 25.0,),
                        Text("Helpline Number",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height : 10,),
                  Center(
                    child: Row(
                      children: [
                        SizedBox(width: 25.0,),
                        Text(num,

                          style: TextStyle(
color: s?Colors.white:Colors.black,
                            fontSize: 30,
                          ),
                        ),
                        SizedBox(width: 20.0,),
                        IconButton(
                          onPressed: (){
                            _makingPhoneCall(num);
                          },
                          icon: Icon(Icons.call,color:Colors.green,
                            size: 30,),),
                      ],
                    ),
                  ),
                  SizedBox(height : 30,),
                  Center(
                    child: Row(
                      children: [
                        SizedBox(width: 25.0,),
                        Text("State",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height : 10,),
                  Center(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                             // color: s?Colors.transparent:Colors.transparent,
                              borderRadius: BorderRadius.circular(10.0),),
                            padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                            child: DropDownFormField(
                              titleText: "",
                              hintText: 'Choose your state',
                              value: state1,
                              onSaved: (value) {
                                setState(() {
                                  state1 = value;
                                });
                                num =_helpline(state1);
                              },
                              onChanged: (value) {
                                setState(() {
                                  state1 = value;
                                });
                                num =_helpline(state1);
                              },
                              dataSource: [
                                {
                                  "display": "Andra Pradesh",
                                  "value": "Andra Pradesh",
                                },
                                {
                                  "display": "Arunachal Pradesh",
                                  "value": "Arunachal Pradesh",
                                },
                                {
                                  "display": "Assam",
                                  "value": "Assam",
                                },
                                {
                                  "display": "Bihar",
                                  "value": "Bihar",
                                },
                                {
                                  "display": "Chandigarh",
                                  "value": "Chandigarh",
                                },
                                {
                                  "display": "Chhattisgarh",
                                  "value": "Chhattisgarh",
                                },
                                {
                                  "display": "Delhi",
                                  "value": "Delhi",
                                },
                                {
                                  "display": "Gujarat",
                                  "value": "Gujarat",
                                },
                                {
                                  "display": "Goa",
                                  "value": "Goa",
                                },
                                {
                                  "display": "Haryana",
                                  "value": "Haryana",
                                },
                                {
                                  "display": "Himachal Pradesh",
                                  "value": "Himachal Pradesh",
                                },
                                {
                                  "display": "Jammu & Kashmir",
                                  "value": "Jammu & Kashmir",
                                },
                                {
                                  "display": "Jharkhand",
                                  "value": "Jharkhand",
                                },
                                {
                                  "display": "Karnataka",
                                  "value": "Karnataka",
                                },
                                {
                                  "display": "Kerala",
                                  "value": "Kerala",
                                },
                                {
                                  "display": "Maharastra",
                                  "value": "Maharastra",
                                },
                                {
                                  "display": "Madhya Pradesh",
                                  "value": "Madhya Pradesh",
                                },
                                {
                                  "display": "Manipur",
                                  "value": "Manipur",
                                },
                                {
                                  "display": "Meghalaya",
                                  "value": "Meghalaya",
                                },
                                {
                                  "display": "Mizoram",
                                  "value": "Mizoram",
                                },
                                {
                                  "display": "Nagaland",
                                  "value": "Nagaland",
                                },
                                {
                                  "display": "Odisha",
                                  "value": "Odisha",
                                },
                                {
                                  "display": "Puducherry",
                                  "value": "Puducherry",
                                },
                                {
                                  "display": "Punjab",
                                  "value": "Punjab",
                                },
                                {
                                  "display": "Rajasthan",
                                  "value": "Rajasthan",
                                },
                                {
                                  "display": "Tamil Nadu",
                                  "value": "Tamil Nadu",
                                },
                                {
                                  "display": "Telangana",
                                  "value": "Telangana",
                                },
                                {
                                  "display": "Tripura",
                                  "value": "Tripura",
                                },
                                {
                                  "display": "Uttar Pradesh",
                                  "value": "Uttar Pradesh",
                                },
                                {
                                  "display": "Uttarkhand",
                                  "value": "Uttarkhand",
                                },
                                {
                                  "display": "West Bengal",
                                  "value": "West Bengal",
                                },
                                {
                                  "display": "Andaman & Nicobar Islands",
                                  "value": "Andaman & Nicobar Islands",
                                },
                                {
                                  "display": "Dadra & Nagar Haveli",
                                  "value": "Dadra & Nagar Haveli",
                                },
                                {
                                  "display": "Sikkim",
                                  "value": "Sikkim",
                                },
                                {
                                  "display": "Leh-Ladakh",
                                  "value": "Leh-Ladakh",
                                },
                              ],
                              textField: 'display',
                              valueField: 'value',
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height : 30,),
                  Center(
                    child: Row(
                      children: [
                        SizedBox(width: 25.0,),
                        Text("Helpline Mail",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height : 10,),
                  Center(
                    child: TextButton(
                      onPressed: (){
                        launch(_emailLaunchUri.toString());
                      },
                      child: Container(
                        height: 40.0,
                        padding: EdgeInsets.symmetric(horizontal: 28.0,),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8.0),),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(Icons.mail,color: Colors.white,),
                              SizedBox(width: 5,),
                              Text("Email",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),),
                            ],
                          ),
                        ),),
                    ),
                  ),
                  SizedBox(height : 10,),
                  Center(
                    child: Row(
                      children: [
                        SizedBox(width: 25.0,),
                        Text("Book your vaccine",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height : 10,),
                  Center(
                    child: TextButton(
                      onPressed: (){
                        launch("https://www.cowin.gov.in/home");
                      },
                      child: Container(
                        height: 40.0,
                        padding: EdgeInsets.symmetric(horizontal: 28.0,),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(8.0),),
                        child: Center(
                          child: Row(
                            children: [
                              Icon(Icons.mail,color: Colors.white,),
                              SizedBox(width: 5,),
                              Text("Vaccine",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),),
                            ],
                          ),
                        ),),
                    ),
                  ),

                ],
              ),
              ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
