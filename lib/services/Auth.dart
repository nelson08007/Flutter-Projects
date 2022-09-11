

import 'package:box_aload/services/DatabaseService.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance ;

Stream<User?> get user => _auth.authStateChanges();



  Future signOut() async {

    try{
      await _auth.signOut();
      return "Signed Out";
    }
    on FirebaseAuthException catch (e){
    return e.message;
    }

  }
  Future signIn(String email , String password ) async {
    try{
       await _auth.signInWithEmailAndPassword(email: email, password: password);
       return "Signed In";
    }
    on FirebaseAuthException catch (e){
      return e.message;
    }
  }

  Future signUp (String email , String password, String role, String verify) async {
    try {
        UserCredential result= await _auth.createUserWithEmailAndPassword(email: email, password: password);
       User user = result.user!;

          await DatabaseService(uid: user.uid).getuserData1(
       role, verify,
    "choose this field", "Enter your first name", "Enter your last name", "Enter region",
    "choose your date of birth", "Enter your phone number", "Enter your street/house number",
    "Enter your Zipcode", "Enter your city", "Enter your IBAN number", "Enter your bank name",
    "Enter benificiary name", 'Enter your address', "Enter your company name",user.email!
          );

          if(role == 'advertiser'){
            await DatabaseService(uid: user.uid).startcampaign(user.uid);
          }

        return "Signed Up";
    }

    on FirebaseAuthException catch (e) {
      return e.message;
    }

  }



}


