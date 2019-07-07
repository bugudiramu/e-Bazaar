import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth {
  Future<FirebaseUser> googleSignIn();
}

class Auth implements BaseAuth {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<FirebaseUser> googleSignIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    try {
      FirebaseUser user = await firebaseAuth.signInWithCredential(credential);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
