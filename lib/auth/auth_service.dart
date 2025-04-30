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

  //sign out
  Future<void> signout() async {
    await auth.signOut();
  }

  //error
}
