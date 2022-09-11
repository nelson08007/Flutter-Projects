import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({ this.uid });
  final CollectionReference person = FirebaseFirestore.instance.collection("users");

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

}