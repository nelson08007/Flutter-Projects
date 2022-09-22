import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({ this.uid });
  final CollectionReference person = FirebaseFirestore.instance.collection("users");
  //final CollectionReference messages = FirebaseFirestore.instance.collection('users/$uid/messages');
  // sign up using email id
  Future<void> signupUser (
      String name,
      String email,
      String mobile,
      ) async {
    return await person.doc(uid).set(
        {
          'name': name,
          'email': email,
          'mobile':mobile,
          'money': '0',
          'deposit': false,
          'withdraw':false,
          'coords': GeoPoint(10.7870,79.1378),
          'uid' : uid,
          'pic': 'https://firebasestorage.googleapis.com/v0/b/cashtroops-demo.appspot.com/o/Assets%2Fimages%20(10).jpeg?alt=media&token=5062f056-5a10-46aa-816f-af3f34b6f0c0'
        }
    );
  }

  // to toggle cash deposit
  Future<void> toggleDeposit (bool value) async {
    return await person.doc(uid).update(
        {
          'deposit': value,
        }
    );
  }

  // to toggle cash withdraw
  Future<void> toggleWithdraw (bool value) async {
    return await person.doc(uid).update(
        {
          'withdraw':value,
        }
    );
  }

  Future updateLocation(double lat , double lng ) async {
    return await person.doc(uid).update(
        {
          'coords': GeoPoint(lat,lng),
        }
    );
  }

  //to update profile pic
  Future<void> updatepic (String url) async {
    return await person.doc(uid).update(
        {
          'pic': url,
        }
    );
  }

  Future<void> uploadMessage (
      String sender ,
      String receiver ,
      String mode,
      String amount ,
      String status,
      String message
      ) async {
    return await FirebaseFirestore.instance.collection('users/$uid/messages').add(
      {
        'sender' : sender,
        'receiver': receiver,
        'mode': mode,
        'amount': amount,
        'message': message,
        'status': status,
        'time': DateTime.now(),
      }

    );
  }
}