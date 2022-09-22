import 'package:cashtroopsdemo/Screens/AfterLogin/NearbyMe/Chat.dart';
import 'package:flutter/material.dart';


class SendMoneyPage extends StatefulWidget {
  String mode;
  String name;
  String pic;
  String uid;
  SendMoneyPage(this.mode,this.name,this.pic,this.uid);

  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  List numberAsList = [];

  String money = '';


  @override
  Widget build(BuildContext context) {
    final color1 = Theme.of(context).dividerColor;
    return Scaffold(
      //backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: color1,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text(widget.mode+widget.name,
          style: TextStyle(
            color: color1,
          ),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.pic),
            ),
            title: Text(
                widget.name,
                style:TextStyle(
                  color: color1,
                  fontWeight: FontWeight.bold,
                )
            ),
            subtitle: Text(
                widget.mode == "Deposit to" ? "Cash Desposit" : "Cash Withdraw",
                style:TextStyle(
                  color: Colors.grey,
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:28),
            child: RichText(
//$
                text: TextSpan(
                  text: '\u{20B9}',
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.grey.withOpacity(0.5),
                    fontWeight: FontWeight.w300,
                  ),
                  children: [
//20
                    TextSpan(
                      text: money,
                      style: TextStyle(
                        fontSize: 60,
                        color: color1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
//.0
                    if(money!='') TextSpan(
                        text: '',
                        style: TextStyle(
                          fontSize: 60,
                          color: Colors.grey.withOpacity(0.5),
                          fontWeight: FontWeight.w300,
                        )
                    ),
                  ],
                )
            ),
          ),
          Flexible(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: 40,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.5,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: numbers.length,
              itemBuilder: (BuildContext context, int index) {
                int number = numbers[index];
                if(index==9) return Container(height:0,width:0);
                return InkWell(
                  borderRadius: BorderRadius.circular(360),
                  onTap: (){
                    if(index==11){
                      try {
                        setState(()=>money = money.replaceRange(money.length-1, money.length,''));
                      } catch (e) {
                        print("Error removing $e");
                      }
                    }else{
                      setState(()=>money = '$money$number');
                    }
                  },
                  child: Container(
                    child: index==11? Icon(Icons.backspace,color: color1 ):
                    Text(
                        number.toString(),
                        style: TextStyle(
                          color: color1,
                          fontSize: 20,
                        )

                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      shape: BoxShape.circle,
                    ),
                  ),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Chat(
                  uid: widget.uid,
                  name: widget.name,
                  pic: widget.pic,
                  mode: widget.mode,
                  amount: money,
                  status: "Pending"
              )));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:60,vertical:15),
              child: Container(
                height: 55,
                width: double.maxFinite,
                alignment: Alignment.center,
                child: Text(
                    "Request",
                    style:TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    )
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  static List<int> numbers = [1,2,3,4,5,6,7,8,9,-1,0,-1];
}
