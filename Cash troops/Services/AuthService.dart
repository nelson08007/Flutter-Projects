import 'package:cashtroopsdemo/Services/DatabaseService.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance ;

  //Stream<User> get user => _auth.authStateChanges();

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

  Future signUp (String email , String password, String name, String mobile) async {
    try {
      UserCredential result= await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;

      await DatabaseService(uid: user.uid).signupUser(
         name, email , mobile
      );


      return "Signed Up";
    }

    on FirebaseAuthException catch (e) {
      return e.message;
    }

  }

}