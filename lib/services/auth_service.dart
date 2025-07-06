import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //instance
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //sign in

  User? getCurrentUser(){
    return auth.currentUser;
  }
  Future<UserCredential> signinwithemailandpassword(email, password) async {
    try {
      UserCredential credit = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credit;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  //sign up
  Future<UserCredential> signup(email, password, displayName) async {
    try {
      UserCredential cred = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _firestore.collection("Users").doc(cred.user!.uid).set({
        "uid": cred.user!.uid,
        "email": cred.user!.email,
        "name": displayName,
      });

      return cred;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  //sign out
  Future<void> signout() async {
    await auth.signOut();
  }

  //error
}
