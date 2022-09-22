import 'package:cashtroopsdemo/Services/DatabaseService.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
    final String uid;
    final String name;
    final String pic;
    final String mode;
    final String amount;
    final String status;

    const Chat({
        @required this.uid,
        @required this.name,
        @required this.pic,
        @required this.mode,
        @required this.amount,
        @required this.status,
    });

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  User user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    CollectionReference messages = FirebaseFirestore.instance.collection('users/${user.uid}/messages');
    return StreamBuilder<QuerySnapshot>(
      stream:  messages.where('receiver',isEqualTo: widget.uid).snapshots(),
      builder: (BuildContext context , AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("no people"));
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        // Text((document.data() as dynamic)['title'],
        if (snapshot.hasData) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.red,
            body: SafeArea(
              child: Column(
                children: [
                  //profile header
                  Container(
                    height: 80,
                    padding: EdgeInsets.all(16).copyWith(left: 0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BackButton(color: Colors.white),
                            Expanded(
                              child: Text(
                                widget.name,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                //buildIcon(Icons.call),
                                SizedBox(width: 12),
                                //buildIcon(Icons.videocam),
                              ],
                            ),
                            SizedBox(width: 4),
                          ],
                        )
                      ],
                    ),
                  ),

                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: ListView(
                        children: snapshot.data.docs.map((DocumentSnapshot document) {
                          return  MessageWidget(
                            message: document['message'],
                            isMe: document['sender'] == user.uid,
                            pic: widget.pic,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  NewMessageWidget(
                    receiver: user.uid,
                    status: widget.status,
                    mode: widget.mode,
                    amount: widget.amount,
                  ),
                ],
              ),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );


  }
}
class MessageWidget extends StatelessWidget {
  final String message;
  final bool isMe;
  final String pic;


  const MessageWidget({
    @required this.message,
    @required this.isMe,
    @required this.pic,

  });

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(12);
    final borderRadius = BorderRadius.all(radius);

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        if (!isMe)
          CircleAvatar(
              radius: 16, backgroundImage: NetworkImage(pic)),
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(16),
          constraints: BoxConstraints(maxWidth: 140),
          decoration: BoxDecoration(
            color: isMe ? Colors.grey[100] : Colors.red.shade300,
            borderRadius: isMe
                ? borderRadius.subtract(BorderRadius.only(bottomRight: radius))
                : borderRadius.subtract(BorderRadius.only(bottomLeft: radius)),
          ),
          child: Column(
            crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                message,
                style: TextStyle(color: isMe ? Colors.black : Colors.white),
                textAlign: isMe ? TextAlign.end : TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }


}

class NewMessageWidget extends StatefulWidget {
  final String receiver;
  final String mode;
  final String amount;
  final String status;
  const NewMessageWidget({
    @required this.receiver,
    @required this.mode,
    @required this.amount,
    @required this.status,
    Key key,
  }) : super(key: key);

  @override
  _NewMessageWidgetState createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<NewMessageWidget> {
  final _controller = TextEditingController();
  String message = '';
  User user = FirebaseAuth.instance.currentUser;
  void sendMessage() async {
    FocusScope.of(context).unfocus();
    await DatabaseService(uid:user.uid).uploadMessage(
        user.uid,
        widget.receiver,
        widget.mode,
        widget.amount,
        widget.status,
        message);
    //await FirebaseApi.uploadMessage(widget.idUser, message);

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) => Container(
    color: Colors.white,
    padding: EdgeInsets.all(8),
    child: Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: _controller,
            textCapitalization: TextCapitalization.sentences,
            autocorrect: true,
            enableSuggestions: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[100],
              labelText: 'Type your message',
              border: OutlineInputBorder(
                borderSide: BorderSide(width: 0),
                gapPadding: 10,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onChanged: (value) => setState(() {
              message = value;
            }),
          ),
        ),
        SizedBox(width: 20),
        GestureDetector(
          onTap: message.trim().isEmpty ? null : sendMessage,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Icon(Icons.send, color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
