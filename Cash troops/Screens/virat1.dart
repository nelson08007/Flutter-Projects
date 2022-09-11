import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Virat1 extends StatefulWidget {
  String money;
  Virat1(this.money);
  @override
  _Virat1State createState() => _Virat1State();
}

class _Virat1State extends State<Virat1> {

  String url;

  _makingPhoneCall() async {
    url =  'tel:'+ '1234';
    if (await canLaunch(url)){
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void launchMap(String address) async{
    String query = Uri.encodeQueryComponent(address);
    String googleUrl = "https://www.google.com/maps/search/?api=1&query=$query";

    if(await canLaunch(googleUrl)){
      await launch(googleUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Virat"),
        actions: [
          Row(
            children: [
              IconButton(
                  icon: Icon(Icons.location_on,
                color: Colors.black,
              ), onPressed: (){
                launchMap("SASTRA deemed university,Thanjavur");
              }),
              SizedBox(width:20),
              IconButton(
                onPressed: (){
                  _makingPhoneCall();
                },
                icon: Icon(
                    Icons.call,
                  color: Colors.green,
                ),
              ),
              SizedBox(width:20)
            ],
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.black,
          onPressed: (){
           // Navigator.push(context, MaterialPageRoute(builder: (context) => SendMoneyPage() ));
          },
          icon: Icon(
              Icons.payments,
              color: Colors.red
          ),
          label: Text("Request",
            style: TextStyle(
                color: Colors.white
            ),
          )
      ),
      body: Container(
        child: Column(
          children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Card(
            elevation: 20,
            child: Container(
            margin: EdgeInsets.all( 10),
            padding: EdgeInsets.all(10),
            height: 120,
            width: 180,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                     Radius.circular(80)
                )
            ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                        "Cash deposit",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 15
                        )

                    ),
                  ),
                  SizedBox(height:10),
                  Center(
                    child: Text(
                      "\u{20B9} ${double.parse(widget.money)-50}",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 28
                      )

                    ),
                  ),
                  SizedBox(height:12),
                  Center(
                    child: Row(
                      children: [
                        Text(
                            "Commisiion:  ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w700,
                                fontSize: 10
                            )

                        ),
                        SizedBox(height: 10,),
                        Text(
                            "\u{20B9} 50",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w700,
                                fontSize: 18
                            )

                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

          ],
        ),
      ),
    );
  }
}
