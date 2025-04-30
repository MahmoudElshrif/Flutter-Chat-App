import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //instance
  final FirebaseAuth auth = FirebaseAuth.instance;

  //sign in
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
      // await cred.user?.updateDisplayName(displayName);
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
